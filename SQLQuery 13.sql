-- 13.List of stock item groups and total quantity purchased, total quantity sold, and the remaining stock quantity (quantity purchased ¡V quantity sold)
WITH tmp_1 AS(
	SELECT WSISG.StockGroupID, SUM(PPOL.OrderedOuters * WSI.QuantityPerOuter) AS TotalQtyPurchase
	FROM Warehouse.StockItemStockGroups WSISG
	JOIN Purchasing.PurchaseOrderLines PPOL ON WSISG.StockItemID = PPOL.StockItemID
	JOIN Warehouse.StockItems WSI ON WSISG.StockItemID = WSI.StockItemID
	GROUP BY WSISG.StockGroupID),
	tmp_2 AS(
	SELECT  WSISG.StockGroupID, SUM(SOL.Quantity) AS TotalQtySold
	FROM Warehouse.StockItemStockGroups WSISG
	JOIN Sales.OrderLines SOL ON WSISG.StockItemID = SOL.StockItemID
	GROUP BY WSISG.StockGroupID)

SELECT WSISG.StockGroupID, WSG.StockGroupName, tmp_1.TotalQtyPurchase, tmp_2.TotalQtySold,
	( tmp_1.TotalQtyPurchase - tmp_2.TotalQtySold) AS TotalQtyRemining
FROM Warehouse.StockItemStockGroups WSISG
JOIN Warehouse.StockGroups WSG ON WSISG.StockGroupID = WSG.StockGroupID
JOIN tmp_1 ON WSISG.StockGroupID = tmp_1.StockGroupID
JOIN tmp_2 ON WSISG.StockGroupID = tmp_2.StockGroupID
GROUP BY WSISG.StockGroupID,  WSG.StockGroupName,  tmp_1.TotalQtyPurchase, tmp_2.TotalQtySold
ORDER BY WSISG.StockGroupID;

