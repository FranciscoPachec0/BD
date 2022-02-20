SELECT Title, A2.Name
FROM
(MOVIE_ACTOR MA1 NATURAL JOIN ACTOR A1)
JOIN
(MOVIE_ACTOR MA2 NATURAL JOIN ACTOR A2)
USING(MovieId)
NATURAL JOIN MOVIE
WHERE A1.Name = 'Johnny Depp'
AND A2.Name <> 'Johnny Depp'
ORDER BY Title, A2.Name;
