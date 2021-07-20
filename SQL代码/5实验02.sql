-- 利用Query Analyzer进行如下游标练习：
-- 定义一个游标，用于存放作业项目表的全部行数据，并打印以下表头和各行数据。
-- 表头：单据号 预算单位 井号 预算金额 预算人 预算日期 开工日期 完工日期 施工单位 施工内容 材料费 人工费 设备费 其它费用 结算金额 结算人 结算日期 入账金额 入账人 入账日期
-- 执行以上所定义的游标，查看是否能正确输出结果。

BEGIN TRANSACTION
    DECLARE my_cursor SCROLL CURSOR FOR
    SELECT * 
    FROM 作业项目表;
    OPEN my_cursor;
    DECLARE @单据号 VARCHAR(20)
    DECLARE @预算单位 VARCHAR(20)
    DECLARE @井号 VARCHAR(20)
    DECLARE @预算金额 VARCHAR(20)
    DECLARE @预算人 VARCHAR(20)
    DECLARE @预算日期 VARCHAR(20)
    DECLARE @开工日期 VARCHAR(20)
    DECLARE @完工日期 VARCHAR(20)
    DECLARE @施工单位名称 VARCHAR(20)
    DECLARE @施工内容 VARCHAR(20)
    DECLARE @材料费 VARCHAR(20)
    DECLARE @人工费 VARCHAR(20)
    DECLARE @设备费 VARCHAR(20)
    DECLARE @其它费用 VARCHAR(20)
    DECLARE @结算金额 VARCHAR(20)
    DECLARE @结算人 VARCHAR(20)
    DECLARE @结算日期 VARCHAR(20)
    DECLARE @入账金额 VARCHAR(20)
    DECLARE @入账人 VARCHAR(20)
    DECLARE @入账日期 VARCHAR(20)
    PRINT '单据号        ' + '预算单位   ' + '井号   ' + '预算金额   ' + '预算人 ' + ' 预算日期 ' + '   开工日期 ' + '   完工日期 ' + '   施工单位名称 ' + '施工内容 ' + ' 材料费 ' + '   人工费 ' + '   设备费 ' + '   其它费用 ' + '   结算金额 ' + ' 结算人 ' + '结算日期 ' + '   入账金额 ' + '   入账人 ' + ' 入账日期'
    FETCH FIRST FROM my_cursor
    INTO @单据号, @预算单位, @井号, @预算金额, @预算人, @预算日期, @开工日期, @完工日期, @施工单位名称, @施工内容, @材料费, @人工费, @设备费, @其它费用, @结算金额, @结算人, @结算日期, @入账金额, @入账人, @入账日期
    WHILE(@@FETCH_STATUS = 0)
    BEGIN
        PRINT @单据号 + ' ' + @预算单位 + ' ' + @井号 + ' ' + @预算金额 + ' ' + @预算人 + ' ' + @预算日期 + ' ' + @开工日期 + ' ' + @完工日期 + ' ' + @施工单位名称 + ' ' + @施工内容 + ' ' + @材料费 + ' ' + @人工费 + ' ' + @设备费 + ' ' + @其它费用 + ' ' + @结算金额 + ' ' + @结算人 + ' ' + @结算日期 + ' ' + @入账金额 + ' ' + @入账人 + ' ' + @入账日期
        FETCH NEXT FROM my_cursor
        INTO @单据号, @预算单位, @井号, @预算金额, @预算人, @预算日期, @开工日期, @完工日期, @施工单位名称, @施工内容, @材料费, @人工费, @设备费, @其它费用, @结算金额, @结算人, @结算日期, @入账金额, @入账人, @入账日期
    END
    ROLLBACK;
    CLOSE my_cursor;
    DEALLOCATE my_cursor;
