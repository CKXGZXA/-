-- ⑴ 定义一个视图，用于保存作业项目表和材料费表的全部列。

-- CREATE VIEW 作业项目和材料表详细视图
-- AS
-- SELECT 作业项目表.*, 物码, 消耗数量, 单价
-- FROM 作业项目表, 材料消耗明细表
-- WHERE 作业项目表.单据号 = 材料消耗明细表.单据号;

/*
因为 VS code提示:
Incorrect syntax: 'CREATE VIEW' must be the only statement in the batch.
全是红线,
所以我把它注释掉了
*/

-- ⑵ 查询上面定义的视图，可任意组合查询条件，构造出2个查询。
SELECT 结算金额, 消耗数量
FROM 作业项目和材料表详细视图
WHERE 物码 = 'wm003';

SELECT 预算单位, 施工内容
FROM 作业项目和材料表详细视图
WHERE 单据号 = 'zy2018001' AND 物码 = 'wm001';

-- ⑶ 定义一个反映作业项目预算状态的视图，并向该视图插入('zy2018008','112202002','y005',10000,'张三', '2018-07-02')，查看作业项目表的数据有何变化。

-- CREATE VIEW 预算状态视图
-- AS
-- SELECT 单据号, 预算单位, 井号, 预算金额, 预算人, 预算日期
-- FROM 作业项目表;

INSERT INTO 预算状态视图 VALUES('zy2018008','112202002','y005',10000,'张三', '2018-07-02');

-- ⑷ 撤销上述成功的更新操作。

DELETE FROM 作业项目表
WHERE 单据号 = 'zy2018008';