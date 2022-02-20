UPDATE STREAM 
SET Charge = 0
WHERE CustomerId IN (
	  SELECT CustomerId FROM CUSTOMER
      JOIN COUNTRY ON (CUSTOMER.Country = COUNTRY.Name)
      JOIN REGION USING (RegionId)
      WHERE REGION.Name <> 'America'
      )
AND 
MovieId IN (
	SELECT MovieId FROM MOVIE 
    JOIN MOVIE_GENRE USING (MovieId)
    JOIN GENRE USING (GenreId)
    where Duration <= 120 and Label = 'Biography'
    );