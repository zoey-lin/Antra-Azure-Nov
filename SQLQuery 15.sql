-- 15.List any orders that had more than one delivery attempt (located in invoice table).
SELECT OrderID
FROM Sales.Invoices
WHERE JSON_VALUE(ReturnedDeliveryData, '$.Events[1].Comment') IS NOT NULL
ORDER BY OrderID;
