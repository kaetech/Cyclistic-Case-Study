-- removing all null values (1,298,357 rows)
DELETE FROM `halogen-chemist-405717.cyclistic_2022.annual_data`
WHERE ride_id IS NULL OR rideable_type IS NULL OR started_at IS NULL OR ended_at IS NULL OR month IS NULL OR rental_day IS NULL OR 
  start_station_name IS NULL OR start_station_id IS NULL OR end_station_name IS NULL OR end_station_id IS NULL OR 
  start_lat IS NULL OR start_lng IS NULL OR end_lat IS NULL OR end_lng IS NULL OR member_casual IS NULL;
-- checking for remaining null values (0 remaining)
SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
FROM `halogen-chemist-405717.cyclistic_2022.annual_data`;
-- checking for discrepancies in rideable_type (none found)
select distinct rideable_type
from `halogen-chemist-405717.cyclistic_2022.annual_data`
-- checking for discrepancies in member_casual (none found)
select distinct member_casual
from `halogen-chemist-405717.cyclistic_2022.annual_data`
-- adding ride length column and calculating ride length 
ALTER TABLE `halogen-chemist-405717.cyclistic_2022.annual_data`
ADD COLUMN ride_length INT64;
UPDATE `halogen-chemist-405717.cyclistic_2022.annual_data`
  SET ride_length = DATETIME_DIFF(ended_at, started_at, MINUTE)
  WHERE true;
-- removing trips with a ride length of less than 1 minute or over 1 day (44,797 rows)
DELETE FROM `halogen-chemist-405717.cyclistic_2022.annual_data`
WHERE ride_length < 1  OR ride_length > 1400
