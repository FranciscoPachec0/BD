DELETE FROM MOVIE_ACTOR 
WHERE MovieId IN (
			select MovieId FROM MOVIE_GENRE
            JOIN GENRE USING (GenreId)
            where Label = 'Action'
            )
AND 
MovieId NOT IN (
			Select MovieId FROM STREAM 
            );
            
            