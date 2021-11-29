-- 2. If the customer's primary contact person has the same phone number as the customer's phone number, list the customer companies. 
-------- can't find campany info, select customers' names instead
SELECT SC.CustomerName
FROM Sales.Customers SC
JOIN Application.People AP
ON SC.PrimaryContactPersonID = AP.PersonID
WHERE SC.PhoneNumber = AP.PhoneNumber;
