select Title, StreamDate, Charge from MOVIE JOIN STREAM USING (MovieId) JOIN MOVIE_GENRE USING (MovieId) JOIN GENRE USING (GenreId)
where year(StreamDate) = 2017 and month(StreamDate) = 12 
and Label = 'Thriller'
order by Title, StreamDate desc; 
