DROP VIEW IF EXISTS REGION_DATA;

CREATE VIEW REGION_DATA(Name, Manager, Countries, Customers)
AS
SELECT REGION.Name, STAFF.Name, count(DISTINCT COUNTRY.Name) as Countries, count(CustomerId) as Customers FROM REGION 
JOIN COUNTRY USING (RegionId)
JOIN STAFF ON (STAFF.StaffId = REGION.RegionManager)
JOIN CUSTOMER ON (COUNTRY.Name = CUSTOMER.Country)
group by REGION.Name, STAFF.Name;