-- 12.List all the Order Detail (Stock Item name, delivery address, delivery state, city, country, customer name, customer contact person name, customer phone, quantity) for the date of 2014-07-01. Info should be relevant to that date.
SELECT SO.OrderID, SO.OrderDate, WSI.StockItemName, SOL.Quantity,
	SC.CustomerName, SC.PhoneNumber AS CustotmerPhoneNum, AP.FullName AS ContactPerson,
	ACON.CountryName, ASP.StateProvinceName, AC.CityName, SC.DeliveryAddressLine1, SC.DeliveryAddressLine2
FROM Sales.OrderLines SOL
JOIN Sales.Orders SO
ON SOL.OrderID = SO.OrderID
JOIN Sales.Customers SC
ON SO.CustomerID = SC.CustomerID
JOIN Application.Cities AC
ON SC.PostalCityID = AC.CityID
JOIN Application.StateProvinces ASP
ON AC.StateProvinceID = ASP.StateProvinceID
JOIN Application.Countries ACON
ON ASP.CountryID = ACON.CountryID
JOIN Application.People AP
ON SC.PrimaryContactPersonID = AP.PersonID
JOIN Warehouse.StockItems WSI
ON SOL.StockItemID = WSI.StockItemID
WHERE SO.OrderDate = '2014-07-01'
ORDER BY SO.OrderID;
