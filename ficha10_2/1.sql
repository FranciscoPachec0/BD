Select Name, count(StreamId) AS N, Sum(Charge) FROM CUSTOMER
LEFT OUTER JOIN STREAM USING (CustomerId)
where Country = 'India'
group by Name
HAVING N <=5
order by Name;