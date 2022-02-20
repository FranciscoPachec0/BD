SELECT Title, count(StreamId) AS N FROM STREAM
JOIN MOVIE USING (MovieId) 
JOIN CUSTOMER USING (CustomerId)
JOIN COUNTRY ON (COUNTRY.Name = CUSTOMER.Country)
JOIN REGION USING (RegionId)
where REGION.Name = 'Asia'
group by Title
order by N desc, Title
LIMIT 20;