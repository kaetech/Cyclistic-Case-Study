-- Creating one large table comprised of the 12 data tables for the year 2022
CREATE TABLE IF NOT EXISTS `halogen-chemist-405717.cyclistic_2022.annual_data` AS (
   SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202201`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202202`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202203`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202204`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202205`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202206`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202207`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202208`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202209`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202210`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202211`
UNION ALL
 SELECT * FROM `halogen-chemist-405717.cyclistic_2022.202212`)
--counting number of rows which is 5,667,717
SELECT COUNT(*)
FROM `halogen-chemist-405717.cyclistic_2022.annual_data`
