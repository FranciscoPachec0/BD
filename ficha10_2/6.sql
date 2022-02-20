DELETE FROM MOVIE_ACTOR 
where MovieId IN(
		SELECT MovieId FROM MOVIE_GENRE
        JOIN GENRE USING (GenreId)
        where Label = 'Action'
        )
AND 
MovieId NOT IN (
		SELECT MovieId FROM STREAM 
        );
