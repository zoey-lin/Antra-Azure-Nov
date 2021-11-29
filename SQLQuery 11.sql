-- 11.List all the cities that were updated after 2015-01-01
SELECT AC.CityID, AC.CityName, AC.ValidFrom
FROM Application.Cities AC
WHERE AC.ValidFrom >= '2015-01-01'
ORDER BY AC.ValidFrom;

