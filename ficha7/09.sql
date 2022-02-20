select ACTOR.Name, count(*) as N 
from ACTOR join MOVIE_ACTOR
where (ACTOR.ActorId = MOVIE_ACTOR.ActorId)
group by Name
Having N >= 15
order by N desc, Name asc;