INSERT INTO 单位代码表 (单位代码, 单位名称) VALUES ('1122', '采油厂');
INSERT INTO 单位代码表 (单位代码, 单位名称) VALUES ('112201', '采油一矿');
INSERT INTO 单位代码表 (单位代码, 单位名称) VALUES ('112202', '采油二矿');
INSERT INTO 单位代码表 (单位代码, 单位名称) VALUES ('112201001', '采油一矿一队');
INSERT INTO 单位代码表 (单位代码, 单位名称) VALUES ('112201002', '采油一矿二队');
INSERT INTO 单位代码表 (单位代码, 单位名称) VALUES ('112201003', '采油一矿三队');
INSERT INTO 单位代码表 (单位代码, 单位名称) VALUES ('112202001', '采油二矿一队');
INSERT INTO 单位代码表 (单位代码, 单位名称) VALUES ('112202002', '采油二矿二队');

INSERT INTO 油水井表 (井号,井别,单位代码) VALUES ('y001','油井','112201001');
INSERT INTO 油水井表 (井号,井别,单位代码) VALUES ('y002','油井','112201001');
INSERT INTO 油水井表 (井号,井别,单位代码) VALUES ('y003','油井','112201002');
INSERT INTO 油水井表 (井号,井别,单位代码) VALUES ('s001','水井','112201002');
INSERT INTO 油水井表 (井号,井别,单位代码) VALUES ('y004','油井','112201003');
INSERT INTO 油水井表 (井号,井别,单位代码) VALUES ('s002','水井','112202001');
INSERT INTO 油水井表 (井号,井别,单位代码) VALUES ('s003','水井','112202001');
INSERT INTO 油水井表 (井号,井别,单位代码) VALUES ('y005','油井','112202002');

INSERT INTO 施工单位表(施工单位名称) VALUES ('作业公司作业一队');
INSERT INTO 施工单位表(施工单位名称) VALUES ('作业公司作业二队');
INSERT INTO 施工单位表(施工单位名称) VALUES ('作业公司作业三队');

INSERT INTO 物码表(物码, 名称规格,计量单位) VALUES('wm001','材料一','吨');
INSERT INTO 物码表(物码, 名称规格,计量单位) VALUES('wm002','材料二','米');
INSERT INTO 物码表(物码, 名称规格,计量单位) VALUES('wm003','材料三','桶');
INSERT INTO 物码表(物码, 名称规格,计量单位) VALUES('wm004','材料四','袋');

INSERT INTO 作业项目表(单据号, 预算单位, 井号, 预算金额, 预算人, 预算日期, 开工日期, 完工日期, 施工单位, 施工内容, 材料费, 人工费, 设备费, 其它费用, 结算金额, 结算人, 结算日期,入账金额, 入账人, 入账日期) VALUES('zy2018001','112201001','y001', 10000.00, '张三', '2018-5-1', '2018-5-4', '2018-5-25', '作业公司作业一队', '堵漏',7000.00, 2500.00, 1000.00, 1400.00, 11900.00, '李四', '2018-5-26', 11900.00, '王五', '2018-5-28');
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018001', 'wm001', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018001', 'wm002', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018001', 'wm003', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018001', 'wm004', 100, 10.00 );
INSERT INTO 作业项目表(单据号, 预算单位, 井号, 预算金额, 预算人, 预算日期, 开工日期, 完工日期, 施工单位, 施工内容, 材料费, 人工费, 设备费, 其它费用, 结算金额, 结算人, 结算日期,入账金额, 入账人, 入账日期) VALUES('zy2018002','112201002','y003', 11000.00, '张三', '2018-5-1', '2018-5-4', '2018-5-23', '作业公司作业二队', '检泵',6000.00, 1500.00, 1000.00, 2400.00, 10900.00, '李四', '2018-5-26', 10900.00, '王五', '2018-5-28');
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018002', 'wm001', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018002', 'wm002', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018002', 'wm003', 200, 10.00 );
INSERT INTO 作业项目表(单据号, 预算单位, 井号, 预算金额, 预算人, 预算日期, 开工日期, 完工日期, 施工单位, 施工内容, 材料费, 人工费, 设备费, 其它费用, 结算金额, 结算人, 结算日期,入账金额, 入账人, 入账日期) VALUES('zy2018003','112201002','s001', 10500.00, '张三', '2018-5-1', '2018-5-6', '2018-5-23', '作业公司作业二队', '调剖',6500.00, 2000.00, 500.00, 1400.00, 10400.00, '李四', '2018-5-26', 10400.00, '王五', '2018-5-28');
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018003', 'wm001', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018003', 'wm002', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018003', 'wm003', 250, 10.00 );
INSERT INTO 作业项目表(单据号, 预算单位, 井号, 预算金额, 预算人, 预算日期, 开工日期, 完工日期, 施工单位, 施工内容, 材料费, 人工费, 设备费, 其它费用, 结算金额, 结算人, 结算日期,入账金额, 入账人, 入账日期) VALUES('zy2018004','112202001','s002', 12000.00, '张三', '2018-5-1', '2018-5-4', '2018-5-24', '作业公司作业三队', '解堵',6000.00, 2000.00, 1000.00, 1600.00, 10600.00, '李四', '2018-5-26', 10600.00, '赵六', '2018-5-28');
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018004', 'wm001', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018004', 'wm002', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018004', 'wm004', 200, 10.00 );
INSERT INTO 作业项目表(单据号, 预算单位, 井号, 预算金额, 预算人, 预算日期, 开工日期, 完工日期, 施工单位, 施工内容, 材料费, 人工费, 设备费, 其它费用, 结算金额, 结算人, 结算日期) VALUES('zy2018005','112202002','y005', 12000.00, '张三', '2018-5-1', '2018-5-4', '2018-5-28', '作业公司作业三队', '防砂',7000.00, 1000.00, 2000.00, 1300.00, 11300.00, '李四', '2018-6-1');
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018005', 'wm001', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018005', 'wm002', 200, 10.00 );
INSERT INTO 材料消耗明细表( 单据号, 物码, 消耗数量, 单价 ) VALUES( 'zy2018005', 'wm004', 300, 10.00 );
