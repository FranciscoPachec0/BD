DROP FUNCTION IF EXISTS getChargeValue;
DELIMITER $

CREATE FUNCTION
getChargeValue(stream_time DATETIME, movie_id INT, customer_id INT)
RETURNS DECIMAL(4,2)
BEGIN
  DECLARE c DECIMAL(4,2);
  DECLARE movie_duration INT;
  DECLARE country_name VARCHAR(128);
  DECLARE region_name VARCHAR(128);
  
  SELECT Duration INTO movie_duration
  FROM MOVIE WHERE MovieId = movie_id;
  
  SELECT COUNTRY INTO country_name 
  FROM CUSTOMER WHERE CustomerId = customer_id;
  
  SELECT REGION.NAME INTO region_name FROM CUSTOMER JOIN COUNTRY ON(CUSTOMER.Country = COUNTRY.Name)
  JOIN REGION USING(RegionId) where CustomerId = customer_id;
  
  SET c = 0.5 + 0.01 * movie_duration;
  IF HOUR(stream_time) >= 21 THEN
    SET c = c + 0.75;
    IF WEEKDAY(stream_time) >= 4 THEN
      SET c = c + 0.75;
    END IF;
  END IF;
  IF country_name = 'United States' THEN
        SET c = c + 1;
end if;
          IF region_name = 'Europe' THEN
            SET c = c + 1;
        end if;
  RETURN c;
END;