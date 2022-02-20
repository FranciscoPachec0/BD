select year, count(*) AS n from MOVIE
where (duration>=120)
group by year having n>20;