--  创建一个用户user12，以user12的身份执行实验六中所定义的存储过程，观察记录是否成功执行；
--  然后把该存储过程的执行权限授予给user12，再次以user12的身份执行该存储过程，观察记录是否成功执行。


-- 创建用户user12
CREATE LOGIN user02 WITH PASSWORD ='12345';
CREATE USER user12 FOR LOGIN user02;
GO

-- 切换到user12
SETUSER 'user12'
GO

-- 直接执行存储过程, 报以下错误,无法成功执行
EXEC 成本运行情况_proc @单位代码 = '1122', @起始日期 = '2018-5-1', @结束日期 = '2018-5-29';
EXEC 成本运行情况_proc @单位代码 = '112201', @起始日期 = '2018-5-1', @结束日期 = '2018-5-29';
EXEC 成本运行情况_proc @单位代码 = '112201001', @起始日期 = '2018-5-1', @结束日期 = '2018-5-29';
/*
Msg 229, Level 14, State 5, Procedure 成本运行情况_proc, Line 1
拒绝了对对象 '成本运行情况_proc' (数据库 'zyxt'，架构 'dbo')的 EXECUTE 权限。 
Msg 229, Level 14, State 5, Procedure 成本运行情况_proc, Line 1
拒绝了对对象 '成本运行情况_proc' (数据库 'zyxt'，架构 'dbo')的 EXECUTE 权限。 
Msg 229, Level 14, State 5, Procedure 成本运行情况_proc, Line 1
拒绝了对对象 '成本运行情况_proc' (数据库 'zyxt'，架构 'dbo')的 EXECUTE 权限。
*/

-- 授权给user12 对存储过程 成本运行情况_proc 的exec权限, 成功执行
SETUSER
use zyxt
GRANT EXECUTE
ON 成本运行情况_proc
TO user12
GO

-- 授权之后执行存储过程, 成功执行
SETUSER 'user12'
GO
EXEC 成本运行情况_proc @单位代码 = '1122', @起始日期 = '2018-5-1', @结束日期 = '2018-5-29';
EXEC 成本运行情况_proc @单位代码 = '112201', @起始日期 = '2018-5-1', @结束日期 = '2018-5-29';
EXEC 成本运行情况_proc @单位代码 = '112201001', @起始日期 = '2018-5-1', @结束日期 = '2018-5-29';
GO