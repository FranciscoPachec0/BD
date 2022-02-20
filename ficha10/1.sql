select Name, count(StreamId) as N, SUM(Charge) from CUSTOMER C LEFT OUTER JOIN STREAM S USING (CustomerId)
where C.Country = 'India'
group by Name
HAVING N <=5;