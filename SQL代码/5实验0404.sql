-- ⑷ 对上述3个触发器用适当的更新语句进行验证，并查看结果是否达到预期结果。

-- 1.插入
BEGIN TRAN
-- 插入一条测试数据
INSERT INTO 作业项目表(单据号, 材料费, 人工费, 设备费, 其它费用) VALUES('test01', '111','222', '333', '333');
-- 查看结算金额是否更新
SELECT * 
FROM 作业项目表 
WHERE 单据号 LIKE 'test%'
-- 回滚
ROLLBACK

-- 2. 修改
-- 准备修改 单据号 = 'zy2018001' 的数据
-- 查看原数据
BEGIN TRAN
SELECT 单据号, 材料费, 人工费, 设备费, 其它费用, 结算金额
FROM 作业项目表
WHERE 单据号 = 'zy2018001';
-- 更新数据
UPDATE 作业项目表
SET 材料费 = 材料费 - 1000
WHERE 单据号 = 'zy2018001';
-- 再次查看
SELECT 单据号, 材料费, 人工费, 设备费, 其它费用, 结算金额
FROM 作业项目表
WHERE 单据号 = 'zy2018001';
-- 回滚
ROLLBACK TRAN

-- 3. 删除
-- 准备删除 单据号 = 'zy2018001' 的数据
-- 查看原数据
BEGIN TRAN
SELECT *
FROM 材料消耗明细表
WHERE 单据号 = 'zy2018001';
-- 删除 单据号 = 'zy2018001' 的数据
DELETE 
FROM 作业项目表
WHERE 作业项目表.单据号 = 'zy2018001';
-- 查询数据
SELECT * 
FROM 材料消耗明细表
WHERE 单据号 = 'zy2018001';

-- 回滚
ROLLBACK

