-- 7. List of States and Avg dates for processing (confirmed delivery date ?order date).
-- create ProcessingDay and DeliveryState in Sales.Invoices
ALTER TABLE Sales.Invoices
ADD ProcessingDay INT;
ALTER TABLE Sales.Invoices
ADD DeliveryState NVARCHAR(50);
UPDATE Sales.Invoices
SET ProcessingDay = (SELECT DATEDIFF(DAY, SO.OrderDate, CONVERT(VARCHAR(10), SI.ConfirmedDeliveryTime, 111)))
FROM Sales.Orders SO
JOIN Sales.Invoices SI
ON SO.OrderID = SI.OrderID
WHERE SO.OrderID = SI.OrderID;
UPDATE Sales.Invoices
SET DeliveryState = (SELECT ASP.StateProvinceName)
FROM Sales.Invoices SI
JOIN Sales.Orders SO
ON SI.OrderID = SO.OrderID
JOIN Sales.Customers SC
ON SO.CustomerID = SC.CustomerID
JOIN Application.Cities AC
ON SC.PostalCityID = AC.CityID
JOIN Application.StateProvinces ASP
ON AC.StateProvinceID = ASP.StateProvinceID
WHERE SO.OrderID = SI.OrderID;
-- result
SELECT DeliveryState, AVG(ProcessingDay) AS AvgProcessingDay
FROM Sales.Invoices
GROUP BY DeliveryState;

