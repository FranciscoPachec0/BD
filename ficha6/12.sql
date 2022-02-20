select REGION.Name, count(*) AS n from REGION join COUNTRY
where (REGION.RegionId = COUNTRY.RegionId)
group by name
order by n asc;