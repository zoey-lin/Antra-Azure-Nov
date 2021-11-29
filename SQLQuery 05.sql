-- 5. List of stock items that have at least 10 characters in description.
SELECT PPOL.StockItemID, PPOL.Description
FROM Purchasing.PurchaseOrderLines PPOL
WHERE LEN(PPOL.Description) >= 10
ORDER BY PPOL.StockItemID;
