-- 6. List of stock items that are not sold to the state of Alabama and Georgia in 2014.
SELECT SOL.StockItemID
FROM Sales.OrderLines SOL
WHERE SOL.StockItemID NOT IN (
	SELECT SOL.StockItemID
	FROM Sales.OrderLines SOL
	JOIN Sales.Orders SO
	ON SOL.OrderID = SO.OrderID
	JOIN Sales.Customers SC
	ON SO.CustomerID = SC.CustomerID
	JOIN Application.Cities AC
	ON SC.PostalCityID = AC.CityID
	JOIN Application.StateProvinces ASP
	ON AC.StateProvinceID = ASP.StateProvinceID
	WHERE ASP.StateProvinceName IN ('Alabama', 'Georgia') AND YEAR(SO.OrderDate) = 2014
	GROUP BY SOL.StockItemID)
GROUP BY SOL.StockItemID
ORDER BY SOL.StockItemID;
