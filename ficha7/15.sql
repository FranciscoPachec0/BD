DELETE FROM STREAM 
	where MovieId IN (
		select MovieId from MOVIE JOIN MOVIE_GENRE USING (MovieId) JOIN GENRE USING(GenreId)
		where duration <= 120 
        AND
        Label = 'Biography'
        )
AND
     CustomerId IN (
		select CustomerId FROM CUSTOMER C JOIN COUNTRY ON (COUNTRY.Name = C.Country) JOIN REGION USING (RegionId)
		where REGION.Name <> 'America'
        );
