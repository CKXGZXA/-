-- 建立采油一矿的作业项目的视图，把该视图的查询权限授予给采油一矿的用户user11，
-- 以user11的身份查询该视图，观察执行情况；再以其他用户的身份查询该视图，观察执行情况。

-- CREATE VIEW 采油一矿视图
-- AS
-- SELECT 单据号, 预算单位, 油水井表.井号, 预算金额, 预算人, 预算日期, 开工日期, 完工日期, 施工单位, 施工内容, 材料费, 人工费, 设备费, 其它费用, 结算金额, 结算人, 结算日期, 井别, 单位名称
-- FROM 作业项目表,油水井表,单位代码表
-- WHERE
-- 预算单位=油水井表.单位代码 AND 预算单位=单位代码表.单位代码;


CREATE LOGIN user01 WITH PASSWORD ='12345';
CREATE USER user11 FOR LOGIN user01;

-- 切换到user11, 执行视图查询
SETUSER 'user11'
SELECT *
FROM 采油一矿视图;


-- 赋予权限之后执行
SETUSER
GRANT SELECT
ON 采油一矿视图
TO user11;

SETUSER
SELECT *
FROM 采油一矿视图;

-- 切换用户
SETUSER

SELECT *
FROM 采油一矿视图;