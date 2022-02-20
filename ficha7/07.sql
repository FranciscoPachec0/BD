UPDATE CUSTOMER set Active = FALSE
where CustomerId
NOT IN (select STREAM.CustomerId from STREAM)
AND CUSTOMER.Country = 'China';