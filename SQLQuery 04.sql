-- 4. List of Stock Items and total quantity for each stock item in Purchase Orders in Year 2013.
SELECT WSI.StockItemID, WSI.StockItemName, COUNT(PPOL.StockItemID) AS TotalQuantity
FROM Warehouse.StockItems WSI
JOIN Purchasing.PurchaseOrderLines PPOL
ON WSI.StockItemID = PPOL.StockItemID
JOIN Purchasing.PurchaseOrders PPO
ON PPOL.PurchaseOrderID = PPO.PurchaseOrderID
WHERE YEAR(PPO.OrderDate) = 2013
GROUP BY WSI.StockItemID, WSI.StockItemName
ORDER BY StockItemID;

