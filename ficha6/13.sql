select CUSTOMER.Name, MAX(STREAM.Charge) as ChargeMax from CUSTOMER join STREAM 
where (CUSTOMER.Country = 'United States' and CUSTOMER.CustomerId = STREAM.CustomerId and year(STREAM.streamDate) = 2018)
group by CUSTOMER.Name
order by ChargeMax desc, name asc;