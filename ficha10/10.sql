DROP FUNCTION IF EXISTS bonus;
DELIMITER $

CREATE FUNCTION bonus(staff_id INT, year INT)
RETURNS INT
BEGIN
  DECLARE value INT;
  DECLARE n INT;
  DECLARE s INT;
  DECLARE r INT;
  
  select count(StreamId) INTO n
  FROM STREAM where year(StreamDate)=year AND month(StreamDate) = 12;
  
  select count(StaffId) INTO s
  FROM STAFF where STAFF.Supervisor = staff_id;
  
  select count(RegionId) INTO r
  FROM REGION where REGION.RegionManager = staff_id;
  
  SET value = n * (s+r+1);
  
  IF (value < 300) then
   SET value = 300;
  END IF;
  
  IF (value > 2000) then 
	SET VALUE = 2000;
  END IF;
  
  RETURN value;
END $

DELIMITER ;