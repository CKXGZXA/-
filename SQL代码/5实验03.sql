-- 利用Query Analyzer定义一个存储过程，要求完成以下功能：
-- 生成某单位(单位可以是采油厂或采油矿或采油队)某段时间内的成本运行情况（输入参数：单位代码 起始日期 结束日期）。
-- 输出格式    ***单位**时间---**时间成本运行情况
-- 预算金额  结算金额  入账金额  未结算金额  未入账金额
--  ****.**   ****.**    ****.**    ****.**     ****.**

-- 其中：未结算金额=预算金额-结算金额
--       未入账金额=结算金额-入账金额
-- 分三种情况（单位分别为：采油厂、采油矿、采油队）执行以上定义的存储过程，查看执行输出结果。
IF OBJECT_ID('成本运行情况_proc', 'p') IS NOT NULL
DROP PROCEDURE 成本运行情况_proc
GO

CREATE PROCEDURE 成本运行情况_proc
    @单位代码 VARCHAR(40),
    @起始日期 DATETIME,
    @结束日期 DATETIME
AS
DECLARE @单位名称 VARCHAR(40)
DECLARE @预算金额 MONEY, @结算金额 MONEY, @入账金额 MONEY, @未结算金额 MONEY, @未入账金额 MONEY
SELECT @单位名称 = 单位名称 
FROM 单位代码表
WHERE 单位代码 = @单位代码

SET @预算金额 = (
        SELECT SUM(预算金额)
        FROM 作业项目表
        WHERE 预算单位 LIKE @单位代码 + '%' AND 预算日期 BETWEEN @起始日期 AND @结束日期
    )
SET @结算金额 = (
        SELECT SUM(结算金额)
        FROM 作业项目表
        WHERE 预算单位 LIKE @单位代码 + '%' AND 结算日期 BETWEEN @起始日期 AND @结束日期
    )
SET @入账金额 = (
        SELECT SUM(入账金额)
        FROM 作业项目表
        WHERE 预算单位 LIKE @单位代码 + '%' AND 入账日期 BETWEEN @起始日期 AND @结束日期 AND 入账金额 IS NOT NULL
    )
SET @未结算金额 = (
        SELECT SUM(预算金额)
        FROM 作业项目表
        WHERE 预算日期 BETWEEN @起始日期 AND @结束日期 AND 结算金额 IS NULL       
    )
SET @未入账金额 = (
        SELECT SUM(结算金额)
        FROM 作业项目表
        WHERE 结算日期 BETWEEN @起始日期 AND @结束日期 AND 结算金额 IS NULL
    )

-- NULL处理
SET @未结算金额 = @预算金额 - @结算金额
SET @未入账金额 = @结算金额 - @入账金额
IF @预算金额 IS NULL
    SET @预算金额 = 0
IF @结算金额 IS NULL
    SET @结算金额 = 0
IF @入账金额 IS NULL
    SET @入账金额 = 0
IF @未结算金额 IS NULL
    SET @未结算金额 = 0
IF @未入账金额 IS NULL
    SET @未入账金额 = 0

DECLARE @result VARCHAR(100)

SET @result = CONVERT(VARCHAR, @预算金额) + ' ' + CONVERT(VARCHAR, @结算金额) + ' ' + CONVERT(VARCHAR, @入账金额) + ' ' + CONVERT(VARCHAR, @未结算金额) + ' ' + CONVERT(VARCHAR, @未入账金额)

PRINT @单位名称 + '单位 ' + CONVERT(VARCHAR, @起始日期, 102) + '---' + CONVERT(VARCHAR, @结束日期, 102) + ' 时间成本运营情况'
PRINT '预算金额  结算金额  入账金额  未结算金额  未入账金额'
PRINT @result

GO

EXEC 成本运行情况_proc @单位代码 = '1122', @起始日期 = '2018-5-1', @结束日期 = '2018-5-29';
EXEC 成本运行情况_proc @单位代码 = '112201', @起始日期 = '2018-5-1', @结束日期 = '2018-5-29';
EXEC 成本运行情况_proc @单位代码 = '112201001', @起始日期 = '2018-5-1', @结束日期 = '2018-5-29';
