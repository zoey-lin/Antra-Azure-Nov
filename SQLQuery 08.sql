-- 8. List of States and Avg dates for processing (confirmed delivery date - order date) by month.
	--(average processing date for every month by every customer)
SELECT * FROM
(SELECT MONTH(OrderDate) AS Months, ProcessingDay, DeliveryState
FROM Sales.Invoices SI
JOIN Sales.Orders SO
ON SI.OrderID = SO.OrderID) TMP
PIVOT(AVG(ProcessingDay)
FOR Months IN ([01], [02], [03], [04], [05], [06], [07], [08], [09], [10], [11], [12])) AS Pivot_Table;

