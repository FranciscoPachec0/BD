UPDATE STREAM
SET Charge = Charge + 1.5
where MovieId In (
Select MovieId from MOVIE 
where MOVIE.Duration >= 180
)
AND
CustomerId IN (
SELECT CustomerId FROM CUSTOMER JOIN COUNTRY ON (CUSTOMER.Country = COUNTRY.Name) 
JOIN REGION ON (COUNTRY.RegionId = REGION.RegionId) 
WHERE REGION.Name = 'Europe'
);
