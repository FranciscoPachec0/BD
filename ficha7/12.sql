UPDATE STREAM
set Charge = 4.5
where CustomerId IN (
SELECT CustomerId FROM CUSTOMER JOIN COUNTRY ON (CUSTOMER.Country = COUNTRY.Name) 
JOIN REGION ON (COUNTRY.RegionId = REGION.RegionId) 
WHERE REGION.Name <> 'Africa'
)
AND 
MovieId IN (
select MovieId from MOVIE M
JOIN MOVIE_GENRE USING (MovieId) JOIN GENRE USING(GenreId) 
where M.Year < 1985 AND GENRE.Label = 'Sci-Fi'
);