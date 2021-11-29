-- 1. List of Person's full names, all their fax and phone numbers, as well as the phone number and fax of the company they are working for (if any).
SELECT AP.FullName, AP.PhoneNumber, AP.FaxNumber
FROM Application.People AP
WHERE AP.IsEmployee = 1;
