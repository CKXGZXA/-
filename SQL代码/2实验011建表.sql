CREATE TABLE 单位代码表 (
	单位代码 CHAR ( 10 ),
	单位名称 CHAR ( 20 )
);

CREATE TABLE 油水井表 (
	井号 CHAR ( 5 ),
	井别 CHAR ( 10 ),
	单位代码 CHAR ( 10 ),
);

CREATE TABLE 施工单位表 (
	施工单位名称 CHAR ( 20 )
);

CREATE TABLE 物码表 ( 
	物码 CHAR ( 6 ),
	名称规格 CHAR ( 10 ),
	计量单位 CHAR ( 5 )
);

CREATE TABLE 作业项目表 (
	单据号 CHAR ( 20 ),
	预算单位 CHAR ( 10 ),
	井号 CHAR ( 5 ),
	预算金额 MONEY,
	预算人 CHAR ( 10 ),
	预算日期 DATE,
	开工日期 DATE,
	完工日期 DATE,
	施工单位 CHAR ( 20 ),
	施工内容 CHAR( 6 ),
	材料费 MONEY,
	人工费 MONEY,
	设备费 MONEY,
	其它费用 MONEY,
	结算金额 MONEY,
	结算人 CHAR(10),
	结算日期 DATE,
	入账金额 MONEY,
	入账人 CHAR(10),
	入账日期 DATE,
);

CREATE TABLE 材料消耗明细表 (
	单据号 CHAR( 20 ),
	物码 CHAR ( 6 ),
	消耗数量 INT,
	单价 MONEY
);
