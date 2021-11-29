-- 10.List of Customers and their phone number, together with the primary contact person’s name, to whom we did not sell more than 10  mugs (search by name) in the year 2016
SELECT SC.CustomerID, SC.CustomerName, SC.PhoneNumber,
	AP.FullName AS PrimaryContactPersonName, AP.PhoneNumber AS PrimaryContactPersonNum, COUNT(SO.CustomerID) AS MugQuantity
FROM Sales.Customers SC
JOIN Application.People AP
ON SC.PrimaryContactPersonID = AP.PersonID
JOIN Sales.Orders SO
ON SC.CustomerID = SO.CustomerID
JOIN Sales.OrderLines SOL
ON SO.OrderID = SOL.OrderID
JOIN Warehouse.StockItems WSI
ON SOL.StockItemID = WSI.StockItemID
WHERE YEAR(SO.OrderDate) = 2016 AND WSI.StockItemName LIKE '%mug%'
GROUP BY SC.CustomerID, SC.CustomerName, SC.PhoneNumber,AP.FullName, AP.PhoneNumber
HAVING COUNT(SO.CustomerID) < 10
ORDER BY SC.CustomerID;
