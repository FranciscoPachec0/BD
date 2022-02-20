SELECT Country, COUNT(*) AS N 
FROM STREAM RIGHT JOIN CUSTOMER USING(CustomerId)
where (STREAM.Streamid IS NULL)
group by Country;