-- ⑵ 当修改作业表的某行数据时自动修改结算金额字段。
IF OBJECT_ID('修改_更新结算金额触发器','TR') IS NOT NULL
DROP TRIGGER 修改_更新结算金额触发器;
GO

CREATE TRIGGER 修改_更新结算金额触发器
ON 作业项目表
AFTER UPDATE
AS
DECLARE @结算金额 MONEY;
DECLARE @temp1 MONEY, @temp2 MONEY, @temp3 MONEY, @temp4 MONEY;
SELECT @temp1 = 材料费, @temp2 = 人工费, @temp3 = 设备费, @temp4 = 其它费用
FROM inserted;
SET @结算金额 = @temp1 + @temp2 + @temp3 + @temp4; 
UPDATE 作业项目表
SET 结算金额 = @结算金额
WHERE 单据号=( 
        SELECT 单据号
        FROM inserted
    );
GO
