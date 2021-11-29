-- 9. List of StockItems that the company purchased more than sold in the year of 2015.
SELECT PPOL.StockItemID
FROM Sales.OrderLines SOL
JOIN Sales.Orders SO
ON SOL.OrderID = SO.OrderID
JOIN Purchasing.PurchaseOrderLines PPOL
ON SOL.StockItemID = PPOL.StockItemID
JOIN Purchasing.PurchaseOrders PPO
ON PPOL.PurchaseOrderID = PPO.PurchaseOrderID
WHERE YEAR(PPO.OrderDate) = 2015
GROUP BY PPOL.StockItemID
HAVING COUNT(SOL.StockItemID) < COUNT(PPOL.StockItemID);
