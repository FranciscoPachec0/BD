select StaffID from STAFF 
where (supervisor is null)
UNION
select manager from DEPARTMENT;