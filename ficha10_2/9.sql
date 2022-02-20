SELECT COUNTRY.Name, Label, count(StreamId) as N FROM COUNTRY 
JOIN REGION USING (RegionId)
JOIN CUSTOMER ON (CUSTOMER.Country = COUNTRY.Name)
LEFT OUTER JOIN STREAM USING (CustomerId)
JOIN MOVIE_GENRE USING (MovieId)
JOIN GENRE USING (GenreId)
where REGION.Name = 'Other Countries'
group by COUNTRY.Name, Label
order by COUNTRY.Name, Label, N desc;
/*************************/
SELECT res.Country,
    res.Label,
    COUNT(sres.StreamId)
FROM STREAM sres
    RIGHT JOIN (
        SELECT c1.CustomerId AS CustomerId,
            c1.Country AS Country,
            mg1.Label AS Label,
            mg1.MovieId AS MovieId
        FROM (
                SELECT g2.Label AS Label,
                    mg2.MovieId AS MovieId
                FROM MOVIE_GENRE mg2
                    JOIN GENRE g2 USING(GenreId)
            ) mg1
            JOIN (
                SELECT c3.CustomerId AS CustomerId,
                    ct3.Name AS Country,
                    r3.Name AS Name
                FROM CUSTOMER c3
                    JOIN COUNTRY ct3 ON(c3.Country = ct3.Name)
                    JOIN REGION r3 ON(
                        ct3.RegionId = r3.RegionId
                        AND r3.Name = 'Other Countries'
                    )
            ) c1
    ) res ON(
        sres.MovieId = res.MovieId
        AND sres.CustomerId = res.CustomerId
    )
GROUP BY res.Country,
    res.Label
ORDER BY res.Country,
    res.Label;