-- 1. 向在实验三中所定义的数据表增加“备注”列，其数据类型为字符型，并查看新增列的值。
ALTER TABLE 数据表
ADD 备注 VARCHAR(50);

-- 2. 对上述数据表增加主码约束条件，并观察在数据表中存在数据的情况下主码约束是否创建成功，
-- 然后再次执行实验三中实验内容3.2的操作，并观察记录执行结果。

ALTER TABLE 数据表 ALTER COLUMN 施工单位 CHAR(20) NOT NULL;
ALTER TABLE 数据表 ALTER COLUMN 年月 VARCHAR(50) NOT NULL;
ALTER TABLE 数据表 ALTER COLUMN 结算金额 MONEY NOT NULL;
GO
ALTER TABLE 数据表 ADD PRIMARY KEY (施工单位, 年月, 结算金额);


-- 3. 删除上述数据表中的数据，然后再删除该数据表，对这两个操作进行比较。
TRUNCATE TABLE [数据表];
DROP TABLE [数据表];