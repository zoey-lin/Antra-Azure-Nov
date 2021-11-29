-- 17.Total quantity of stock items sold in 2015, group by country of manufacturing.
WITH qty AS(
	SELECT SOL.StockItemID, SUM(SOL.Quantity) AS TotalQty
	FROM Sales.OrderLines SOL
	JOIN Sales.Orders SO ON SOL.OrderID = SO.OrderID
	WHERE YEAR(SO.OrderDate) = 2015
	GROUP BY SOL.StockItemID
)
SELECT JSON_VALUE(WSI.CustomFields, '$.CountryOfManufacture') AS CountryOfManufacture, SUM(qty.TotalQty)
FROM Warehouse.StockItems WSI
JOIN qty
ON WSI.StockItemID = qty.StockItemID
GROUP BY JSON_VALUE(WSI.CustomFields, '$.CountryOfManufacture')