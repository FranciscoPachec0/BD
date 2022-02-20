select REGION.Name, count(*) AS n 
from REGION join COUNTRY USING(RegionId) join CUSTOMER where (CUSTOMER.Country = COUNTRY.Name)
group by REGION.Name;