-- 定义触发器，实现只能在工作时间内更新“作业项目表”的数据，
-- 然后通过选择不同的时间进行适当的更新操作来验证。
IF OBJECT_ID('测试触发器','TR')IS NOT NULL
DROP TRIGGER 测试触发器
GO
CREATE TRIGGER 测试触发器
ON 作业项目表 
AFTER UPDATE 
AS
DECLARE @当前时间 DATETIME 
SET @当前时间=GETDATE()
DECLARE @当前星期 VARCHAR(10)
SET @当前星期 = CONVERT(VARCHAR(10),DATEPART(dw,@当前时间)-1); 
IF @当前星期 NOT BETWEEN 1 AND 5 
BEGIN
    IF @@trancount > 0 
    BEGIN 
        ROLLBACK TRANSACTION 
        PRINT '非工作日不能更新数据' 
    END
END
GO
--测试数据(要通过更改系统的时间进行测试)success
BEGIN TRANSACTION
UPDATE 作业项目表
SET 预算人='赵希奥' 
WHERE 单据号='zy2018001';

SELECT 单据号 
FROM 作业项目表
WHERE 单据号 = 'zy2018001';
ROLLBACK