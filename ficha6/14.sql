select Movie.Title from ACTOR natural join MOVIE natural join MOVIE_ACTOR
where (MOVIE_ACTOR.ActorId = 25)
order by Movie.Title;