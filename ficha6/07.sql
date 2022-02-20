Select depId, DEPARTMENT.name, Manager, STAFF.name 
from DEPARTMENT JOIN STAFF 
Where (Manager = StaffId);