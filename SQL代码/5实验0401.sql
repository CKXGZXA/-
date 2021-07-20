-- 利用Query Analyzer针对作业项目表定义三个触发器，分别完成以下功能：
-- ⑴ 对作业项目表插入一行数据时，自动计算并插入结算金额字段（结算金额=材料费+人工费+设备费+其它费用）。
IF OBJECT_ID('插入_更新结算金额触发器','TR') IS NOT NULL
DROP TRIGGER 插入_更新结算金额触发器
GO

CREATE TRIGGER 插入_更新结算金额触发器
ON 作业项目表
AFTER INSERT
AS
DECLARE @结算金额 MONEY;
DECLARE @temp1 MONEY, @temp2 MONEY, @temp3 MONEY, @temp4 MONEY;
SELECT @temp1 = 材料费, @temp2 = 人工费, @temp3 = 设备费, @temp4 = 其它费用
FROM inserted;
SET @结算金额 = @temp1 + @temp2 + @temp3 + @temp4; 
UPDATE 作业项目表
SET 结算金额 = @结算金额
WHERE 单据号 = (
        SELECT 单据号
        FROM inserted
    );
GO
