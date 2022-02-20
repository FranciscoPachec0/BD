select Title from MOVIE JOIN MOVIE_GENRE USING (MovieId) JOIN GENRE USING (GenreId)
where MovieId IN (select MovieId from MOVIE JOIN MOVIE_GENRE USING (MovieId) JOIN GENRE USING (GenreId)
				  where Label = 'Action' 	
                 )
AND 
MovieId IN (select MovieId from MOVIE JOIN MOVIE_GENRE USING (MovieId) JOIN GENRE USING (GenreId)
			where Label = 'Comedy' 	
		   )
group by Title
order by Title;