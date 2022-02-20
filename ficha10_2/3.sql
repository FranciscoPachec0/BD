SELECT Title FROM MOVIE
where MovieId IN (
		select MovieId FROM MOVIE_GENRE
        JOIN GENRE USING (GenreId)
        where Label = 'Action'
        )
AND 
MovieId IN (
	select MovieId FROM MOVIE_GENRE
        JOIN GENRE USING (GenreId)
        where Label = 'Comedy'
    )
order by Title;    