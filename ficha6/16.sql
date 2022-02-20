SELECT Name FROM CUSTOMER NATURAL JOIN STREAM NATURAL JOIN MOVIE
WHERE (hour(StreamDate)>=20 and Duration>=180)
group by name
order by name;