Select REGION.Name, STAFF.Name from REGION join STAFF
where (STAFF.StaffId = REGION.RegionManager)
order by REGION.Name asc;