-- ⑶ 当删除作业表中一行数据时，自动删除材料费表中相应明细数据。
IF OBJECT_ID('删除_更新数据触发器','TR') IS NOT NULL
DROP TRIGGER 删除_更新数据触发器;
GO
CREATE TRIGGER 删除_更新数据触发器 
ON 作业项目表
INSTEAD OF DELETE
AS
DELETE FROM 材料消耗明细表
WHERE 单据号 = ( 
        SELECT 单据号 
        FROM deleted
    );
GO
