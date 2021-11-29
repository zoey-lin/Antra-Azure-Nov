-- 16.List all stock items that are manufactured in China. (Country of Manufacture)
SELECT StockItemID, StockItemName, JSON_VALUE(CustomFields, '$.CountryOfManufacture') AS CountryOfManufacture
FROM Warehouse.StockItems
WHERE JSON_VALUE(CustomFields, '$.CountryOfManufacture') = 'China';