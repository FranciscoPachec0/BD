select title, duration, year, StreamDate from MOVIE natural join STREAM
where (duration>=140 && year = year(StreamDate)-1);