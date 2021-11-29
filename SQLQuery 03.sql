-- 3. List of customers to whom we made a sale prior to 2016 but no sale since 2016-01-01.
SELECT SC.CustomerName, SO.OrderDate
FROM Sales.Customers SC
JOIN Sales.Orders SO
ON SC.CustomerID = SO.CustomerID
WHERE YEAR(SO.OrderDate) < 2016
GROUP BY SC.CustomerName, SO.OrderDate
INTERSECT
SELECT SC.CustomerName, SO.OrderDate
FROM Sales.Customers SC
JOIN Sales.Orders SO
ON SC.CustomerID = SO.CustomerID
WHERE YEAR(SO.OrderDate) !> 2016
GROUP BY SC.CustomerName, SO.OrderDate
ORDER BY SO.OrderDate DESC;
