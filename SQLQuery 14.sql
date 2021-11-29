-- 14.List of Cities in the US and the stock item that the city got the most deliveries in 2016. If the city did not purchase any stock items in 2016, print ¡§No Sales¡¨.
WITH tmp AS (
	SELECT AC.CityID, SOL.StockItemID, WSI.StockItemName, COUNT(SO.OrderID) AS DeliveryQty
	FROM Application.Cities AC
	JOIN Sales.Customers SC ON AC.CityID = SC.PostalCityID 
	JOIN Sales.Orders SO ON SC.CustomerID = SO.CustomerID
	JOIN Sales.OrderLines SOL ON SO.OrderID = SOL.OrderID
	JOIN Warehouse.StockItems WSI ON SOL.StockItemID = WSI.StockItemID
	WHERE YEAR(SO.OrderDate) = 2016
	GROUP BY AC.CityID, SOL.StockItemID, WSI.StockItemName
    ),
	tmp2 AS (
	SELECT tmp.CityID, tmp.StockItemID, tmp.StockItemName, tmp.DeliveryQty
	FROM tmp
	INNER JOIN (SELECT tmp.CityID, MAX(tmp.DeliveryQty) AS MaxDeliveryQty FROM tmp GROUP BY tmp.CityID) AS lookup2
	ON lookup2.CityID = tmp.CityID AND lookup2.MaxDeliveryQty = tmp.DeliveryQty
	)
SELECT AC.CityID, AC.CityName, tmp2.StockItemID, tmp2.StockItemName,
	IIF(AC.CityID IN (tmp2.CityID),CAST(tmp2.DeliveryQty AS varchar),'NO SALE') AS DeliveryQty
FROM Application.Cities AC
LEFT JOIN tmp2 ON ac.CityID = tmp2.CityID
GROUP BY AC.CityID,  AC.CityName, tmp2.StockItemID, tmp2.StockItemName, tmp2.CityID, tmp2.DeliveryQty
Order By AC.CityID
;
