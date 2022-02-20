select title, name from MOVIE natural join MOVIE_ACTOR natural join ACTOR
where (title like '%Superman%');
