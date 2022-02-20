SELECT A1.NAME, A2.NAME, count(DISTINCT M1.MovieId) AS M, count(S.StreamId) AS N 
FROM MOVIE_ACTOR M1 JOIN MOVIE_ACTOR M2 
JOIN ACTOR A1 ON (A1.ActorId = M1.ActorId)
JOIN ACTOR A2 ON (A2.ActorId = M2.ActorId)
JOIN STREAM S ON (M1.MovieID = S.MovieId)
where M1.MovieId = M2.MovieId AND A1.Name < A2.Name 
GROUP BY A1.Name, A2.Name
HAVING N >= 40
ORDER BY N desc, M desc, A1.Name, A2.Name;