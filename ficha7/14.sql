SELECT Title, REGION.Name, COUNT(StreamId) AS N FROM
MOVIE JOIN (REGION JOIN COUNTRY USING (RegionId) JOIN CUSTOMER ON (CUSTOMER.Country = COUNTRY.Name))
LEFT OUTER JOIN STREAM USING (MovieId, CustomerId)
WHERE Title LIKE '%war%'
GROUP BY Title, REGION.Name
ORDER BY Title, REGION.Name;