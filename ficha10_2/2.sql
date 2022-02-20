select Title, StreamDate, Charge FROM MOVIE
JOIN STREAM USING(MovieId)
JOIN MOVIE_GENRE USING(MovieId)
JOIN GENRE USING(GenreId)
where year(StreamDate) = 2017 AND month(StreamDate) = 12 AND Label = 'Thriller'
order by Title, StreamDate desc;