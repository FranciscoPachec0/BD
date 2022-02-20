DROP VIEW IF EXISTS REGION_DATA;
CREATE VIEW REGION_DATA(Name, Manager, Countries, Customers)
AS
SELECT REGION.Name AS Name, STAFF.Name AS Manager, count(DISTINCT COUNTRY.Name) AS Countries, count(CustomerId) AS Customers FROM REGION 
JOIN COUNTRY USING (RegionId)
JOIN CUSTOMER ON (COUNTRY.Name = CUSTOMER.Country)
JOIN STAFF ON (REGION.RegionManager = STAFF.StaffId)
group by REGION.Name;
/*Erro estupido no mooshak*/