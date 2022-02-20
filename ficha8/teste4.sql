SELECT StaffId, getDepartment(StaffId) AS DepId 
FROM STAFF 
ORDER BY DepId, StaffId;