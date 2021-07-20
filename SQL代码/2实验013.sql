-- ⑴ 将编号为zy2018005的项目的人工费和结算金额增加200元。
-- ⑵ 删除已经结算但未入账的项目。
-- ⑶ 撤消上述两个操作。
BEGIN TRANSACTION

SELECT 单据号, 人工费, 入账金额
FROM 作业项目表;

UPDATE 作业项目表
SET 人工费 = 人工费 + 200
WHERE 单据号 = 'zy2018005';

SELECT 单据号, 人工费, 入账金额
FROM 作业项目表;

DELETE 
FROM 作业项目表
WHERE 入账金额 IS NULL;

SELECT 单据号, 人工费, 入账金额
FROM 作业项目表;

ROLLBACK TRANSACTION