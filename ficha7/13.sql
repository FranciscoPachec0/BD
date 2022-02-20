select StreamDate, M.Title, C.Name, C.Country from STREAM 
JOIN MOVIE M USING (MovieId) 
JOIN CUSTOMER C USING (CustomerId)
where C.Country <> 'China'
AND MovieId IN (
  Select MovieId FROM MOVIE_ACTOR
  JOIN ACTOR USING (ActorId)
  where Name = 'Johnny Depp'
)
AND MovieId NOT IN (
  Select MovieId FROM MOVIE_ACTOR
  JOIN ACTOR USING (ActorId)
  where Name = 'Helena Bonham Carter'
)
order by StreamDate desc
LIMIT 15;