-- 1. 对实验二中所定义的6个数据表增加主码约束条件，
-- 并观察在数据表中存在数据的情况下主码约束是否创建成功，
-- 然后执行以下2个操作，观察并记录实体完整性的检查和违约处理。
-- (1) insert  into  材料费表  values('zy2018001','wm004',100,10)
-- (2) insert  into  材料费表  values('zy2018002',NULL,200,10)
-- 注：“材料费表”根据自己所命名的表名进行相应的替换。

-- 增加主码约束条件
ALTER TABLE 单位代码表
ALTER COLUMN 单位代码 CHAR(10) NOT NULL;
GO
ALTER TABLE 单位代码表
ADD CONSTRAINT 单位代码主码约束 PRIMARY KEY (单位代码);
ALTER TABLE 油水井表
ALTER COLUMN 井号 CHAR(5) NOT NULL;
GO
ALTER TABLE 油水井表
ADD CONSTRAINT 井号主码约束 PRIMARY KEY (井号);
ALTER TABLE 施工单位表
ALTER COLUMN 施工单位名称 CHAR(20) NOT NULL;
GO
ALTER TABLE 施工单位表
ADD CONSTRAINT 施工单位主码约束 PRIMARY KEY (施工单位名称);
ALTER TABLE 物码表
ALTER COLUMN 物码 CHAR(6) NOT NULL;
GO
ALTER TABLE 物码表
ADD CONSTRAINT 物码主码约束 PRIMARY KEY (物码);
ALTER TABLE 材料消耗明细表
ALTER COLUMN 单据号 CHAR(20) NOT NULL;
ALTER TABLE 材料消耗明细表
ALTER COLUMN 物码 CHAR(6) NOT NULL;
GO
ALTER TABLE 材料消耗明细表
ADD CONSTRAINT 单据号_物码主码约束 PRIMARY KEY (单据号, 物码);
ALTER TABLE 作业项目表
ALTER COLUMN 单据号 CHAR(20) NOT NULL;
GO
ALTER TABLE 作业项目表
ADD CONSTRAINT 单据号主码约束 PRIMARY KEY (单据号);

-- (1) 执行 insert  into  [材料消耗明细表]  values('zy2018001','wm004',100,10)
INSERT INTO [材料消耗明细表] VALUES('zy2018001', 'wm004', 100, 10);  
-- 无法插入(不能在对象“dbo.材料消耗明细表”中插入重复键。重复键值为 (zy2018001           , wm004 )。)

-- (2) insert  into  [材料消耗明细表]  values('zy2018002',NULL,200,10)
INSERT INTO [材料消耗明细表] VALUES('zy2018002',NULL,200,10);
/* 无法插入, 含有主键非空约束条件
> Msg 515, Level 16, State 2, Server LAPTOP-CKXGZXA\SQLEXPRESS, Procedure , Line 0
不能将值 NULL 插入列 '物码'，表 'zyxt.dbo.材料消耗明细表'；列不允许有 Null 值。INSERT 失败。
*/



-- 2. 对实验二中所定义的6个数据表增加相应的参照完整性约束，
-- 并观察在数据表中存在数据的情况下参照完整性约束是否创建成功，
-- 然后执行以下操作，观察并记录参照完整性的检查和违约处理。
-- (1) 将（y007   油井   112203002）插入到油水井表。
-- (2) insert  into  材料费表  values('zy2018007','wm006',100,10)
-- (3) 作业项目编号zy2018001的施工单位修改为“作业公司作业五队”。
-- (4) 将单位代码表中的（112202002  采油二矿二队）删除，查看油水井表和作业项目表中的数据有何变化。
-- (5) 将物码表中的（wm004 材料四 袋）修改为（wm04 材料四 袋）。
-- (6)撤销上述成功的更新操作。
-- 注：“材料费表”根据自己所命名的表名进行相应的替换。

-- 增加参照完整性约束条件
ALTER TABLE 油水井表
ADD CONSTRAINT 单位代码外码约束 FOREIGN KEY (单位代码) REFERENCES 单位代码表(单位代码);
ALTER TABLE 材料消耗明细表
ADD CONSTRAINT 物码外码约束 FOREIGN KEY (物码) REFERENCES 物码表(物码);
ALTER TABLE 材料消耗明细表
ADD CONSTRAINT 单据号外码约束 FOREIGN KEY (单据号) REFERENCES 作业项目表(单据号);
ALTER TABLE 作业项目表
ADD CONSTRAINT 井号外码约束 FOREIGN KEY (井号) REFERENCES 油水井表(井号);
ALTER TABLE 作业项目表
ADD CONSTRAINT 预算单位外码约束 FOREIGN KEY (预算单位) REFERENCES 单位代码表(单位代码);
ALTER TABLE 作业项目表
ADD CONSTRAINT 施工单位外码约束 FOREIGN KEY (施工单位) REFERENCES 施工单位表(施工单位名称);

-- 然后执行以下操作，观察并记录参照完整性的检查和违约处理。
-- (1) 将（y007   油井   112203002）插入到油水井表。
INSERT INTO [油水井表] VALUES('y007', '油井', '112203002');
/* 无法插入
> Msg 547, Level 16, State 1, Server LAPTOP-CKXGZXA\SQLEXPRESS, Procedure , Line 0
INSERT 语句与 FOREIGN KEY 约束"单位代码外码约束"冲突。该冲突发生于数据库"zyxt"，表"dbo.单位代码表", column '单位代码'。
> 语句已终止。
*/

-- (2) insert  into  材料费表  values('zy2018007','wm006',100,10)
INSERT INTO [材料消耗明细表] VALUES('zy2018007', 'wm006', 100, 10);
/*
无法插入, 因为('zy2018007', 'wm006')在被参照表中不存在
Msg 547, Level 16, State 0, Line 1
INSERT 语句与 FOREIGN KEY 约束"物码外码约束"冲突。该冲突发生于数据库"zyxt"，表"dbo.物码表", column '物码'。 
语句已终止。
*/

BEGIN TRANSACTION
-- (3) 作业项目编号zy2018001的施工单位修改为“作业公司作业五队”。
UPDATE 作业项目表 
SET 施工单位 = '作业公司五队'
WHERE 单据号 = 'zy2018001';
/*
无法修改
    Msg 547, Level 16, State 0, Line 1
    UPDATE 语句与 FOREIGN KEY 约束"施工单位外码约束"冲突。该冲突发生于数据库"zyxt"，表"dbo.施工单位表", column '施工单位名称'。 
    语句已终止。
*/
-- (4) 将单位代码表中的（112202002  采油二矿二队）删除，查看油水井表和作业项目表中的数据有何变化。
DELETE FROM 单位代码表
WHERE 单位代码 = '112202002' AND 单位名称 = '采油二矿二队';
/*
无法删除
Msg 547, Level 16, State 0, Line 1
DELETE 语句与 REFERENCE 约束"单位代码外码约束"冲突。该冲突发生于数据库"zyxt"，表"dbo.油水井表", column '单位代码'。 
语句已终止。
*/

-- (5) 将物码表中的（wm004 材料四 袋）修改为（wm04 材料四 袋）。
UPDATE 物码表
SET 物码 = 'wm04'
WHERE 物码 = 'wm004' AND 名称规格 = '材料四' AND 计量单位 = '袋';
/*
无法修改
Msg 547, Level 16, State 0, Line 1
UPDATE 语句与 REFERENCE 约束"物码外码约束"冲突。该冲突发生于数据库"zyxt"，表"dbo.材料消耗明细表", column '物码'。 
语句已终止。
*/
-- (6)撤销上述成功的更新操作。
ROLLBACK TRANSACTION
/*
没有一个成功的
*/


-- 3. 对实验二中所定义的6个数据表按以下要求增加相应的完整性约束条件，
-- 并观察在数据表中存在数据的情况下完整性约束是否创建成功。
-- (1)单位代码表的单位名称不能取空值、且取值唯一。
ALTER TABLE 单位代码表
ALTER COLUMN 单位名称 CHAR(20) NOT NULL;
ALTER TABLE 单位代码表
ADD UNIQUE(单位名称);
/*
Commands completed successfully.
*/

-- (2)油水井表的井别只允许取“油井”或“水井”，单位代码不能取空值。
ALTER TABLE 油水井表
ADD CONSTRAINT 油水井别 CHECK (井别 IN ('油井', '水井'));
ALTER TABLE 油水井表
ALTER COLUMN 单位代码 CHAR(10) NOT NULL;
/*
Commands completed successfully.
*/

-- (3)物码表的名称规格不能取空值、且取值唯一，计量单位不能取空值。
ALTER TABLE 物码表
ALTER COLUMN 名称规格 CHAR(10) NOT NULL;
ALTER TABLE 物码表
ADD UNIQUE(名称规格);
ALTER TABLE 物码表
ALTER COLUMN 计量单位 CHAR(5) NOT NULL;
/*
Commands completed successfully.
*/

-- (4)材料费表的消耗数量不能取空值，单价不能取空值。
ALTER TABLE 材料消耗明细表
ALTER COLUMN 消耗数量 INT NOT NULL;
ALTER TABLE 材料消耗明细表 
ALTER COLUMN 单价 MONEY NOT NULL;
/*
Commands completed successfully.
*/

-- (5)对作业项目表根据实际应用的要求定义适当的用户定义的完整性约束条件。
-- 在作业项目表中,明显具有 "材料费+人工费+设备费+其他费用=结算金额" 的约束条件,故存在添加以下约束

ALTER TABLE 作业项目表
ADD CONSTRAINT 结算金额约束条件 CHECK (材料费 + 人工费 + 设备费 + 其它费用 = 结算金额);