SELECT MOVIE.Title, COUNT(STREAM.StreamID) AS N
FROM MOVIE LEFT OUTER JOIN STREAM USING (MovieId)
where MOVIE.Year = 2015
GROUP BY Title
HAVING N<=5;