select MOVIE.Title, count(StreamId) AS N FROM MOVIE
JOIN STREAM USING (MovieId)
JOIN CUSTOMER USING (CustomerId)
JOIN COUNTRY ON (CUSTOMER.Country = COUNTRY.Name)
JOIN REGION USING (RegionId)
where REGION.Name = 'Asia'
group by MOVIE.Title
order by N desc, MOVIE.Title
LIMIT 20;