select Label, REGION.Name, count(StreamId) AS N FROM GENRE 
JOIN REGION LEFT OUTER JOIN (
		  MOVIE_GENRE 
          JOIN COUNTRY JOIN CUSTOMER ON (COUNTRY.Name = CUSTOMER.Country)
          JOIN STREAM USING (MovieId, CustomerId)
        ) USING (GenreId, RegionId)
group by Label, REGION.Name
order by Label, REGION.Name;        