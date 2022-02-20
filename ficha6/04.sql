select year(StreamDate), count(*), SUM(charge) from STREAM
group by year(StreamDate);