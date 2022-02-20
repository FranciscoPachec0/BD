SELECT
   CustomerId, Name, Country,
   getChargeValue('2019-04-11 20:59:59', MovieId, CustomerId) AS V1,
   getChargeValue('2019-04-11 21:00:00', MovieId, CustomerId) AS V2,
   getChargeValue('2019-04-12 21:00:00', MovieId, CustomerId) AS V3
FROM MOVIE, CUSTOMER
WHERE Title='Pulp Fiction'
AND 
(
   CustomerId = (SELECT CustomerId FROM CUSTOMER WHERE Country='Brazil' ORDER BY Name LIMIT 1)
OR
   CustomerId = (SELECT CustomerId FROM CUSTOMER WHERE Country='Germany' ORDER BY Name LIMIT 1)
OR 
   CustomerId = (SELECT CustomerId FROM CUSTOMER WHERE Country='United States' ORDER BY Name LIMIT 1)
)
ORDER BY Country;