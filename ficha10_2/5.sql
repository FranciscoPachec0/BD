UPDATE STREAM 
SET Charge = 0
where CustomerId IN (
		SELECT CustomerId FROM CUSTOMER 
        JOIN COUNTRY ON (COUNTRY.Name = CUSTOMER.Country)
        JOIN REGION USING (RegionId)
        where REGION.Name <> 'America'
        )
AND MovieId IN (
		SELECT MovieId FROM MOVIE 
        JOIN MOVIE_GENRE USING (MovieId)
        JOIN GENRE USING (GenreId)
        where Label = 'Biography' AND Duration <= 120
        );