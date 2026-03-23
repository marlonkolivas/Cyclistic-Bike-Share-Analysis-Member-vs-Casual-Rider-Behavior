-- CREATING A NEW CLEAN TABLE

-- Creating new table 
CREATE TABLE cyclistic_trips_clean AS

-- Selecting the columns to keep
SELECT
    ride_id,
    rideable_type,
    started_at_dt,
    ended_at_dt,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    
    -- Cleaning and converting latitude and longitude 
    CASE
        WHEN TRIM(start_lat) REGEXP '^-?[0-9]+(\\.[0-9]+)?$' THEN CAST(TRIM(start_lat) AS DECIMAL(10,6))
        ELSE NULL
    END AS start_lat_num,
    CASE
        WHEN TRIM(start_lng) REGEXP '^-?[0-9]+(\\.[0-9]+)?$' THEN CAST(TRIM(start_lng) AS DECIMAL(10,6))
        ELSE NULL
    END AS start_lng_num,
    CASE
        WHEN TRIM(end_lat) REGEXP '^-?[0-9]+(\\.[0-9]+)?$' THEN CAST(TRIM(end_lat) AS DECIMAL(10,6))
        ELSE NULL
    END AS end_lat_num,
    CASE
        WHEN TRIM(end_lng) REGEXP '^-?[0-9]+(\\.[0-9]+)?$' THEN CAST(TRIM(end_lng) AS DECIMAL(10,6))
        ELSE NULL
    END AS end_lng_num,
    member_casual,
    
    -- Creating ride duration
    TIMESTAMPDIFF(MINUTE, started_at_dt, ended_at_dt) AS ride_length_minutes,
    
    -- Separating date and time 
    DATE(started_at_dt) AS ride_date,
    TIME(started_at_dt) AS ride_time,
   
   -- Creating time-based analysis columns
    DAYNAME(started_at_dt) AS day_of_week,
    DAYOFWEEK(started_at_dt) AS day_num,
    MONTHNAME(started_at_dt) AS month_name,
    MONTH(started_at_dt) AS month_num,
    HOUR(started_at_dt) AS hour_of_day
    
    -- The inner subquery 
FROM (
    SELECT
        TRIM(ride_id) AS ride_id,
        TRIM(rideable_type) AS rideable_type,
        STR_TO_DATE(SUBSTRING_INDEX(TRIM(started_at), '.', 1), '%Y-%m-%d %H:%i:%s') AS started_at_dt,
        STR_TO_DATE(SUBSTRING_INDEX(TRIM(ended_at), '.', 1), '%Y-%m-%d %H:%i:%s') AS ended_at_dt,
        TRIM(start_station_name) AS start_station_name,
        TRIM(start_station_id) AS start_station_id,
        TRIM(end_station_name) AS end_station_name,
        TRIM(end_station_id) AS end_station_id,
        start_lat,
        start_lng,
        end_lat,
        end_lng,
        TRIM(member_casual) AS member_casual
    FROM cyclistic_trips_raw
    WHERE ride_id IS NOT NULL
      AND TRIM(ride_id) <> ''
      AND started_at IS NOT NULL
      AND TRIM(started_at) <> ''
      AND ended_at IS NOT NULL
      AND TRIM(ended_at) <> ''
      AND member_casual IS NOT NULL
      AND TRIM(member_casual) <> ''
) t

-- Filtering bad rows in the query
WHERE started_at_dt IS NOT NULL
  AND ended_at_dt IS NOT NULL
  AND ended_at_dt > started_at_dt;
  
-- A cleaned analysis table was created from the raw Cyclistic trip data. Text fields were trimmed, datetime fields were converted from text into proper datetime values after removing fractional seconds, 
-- and latitude/longitude fields were safely converted into numeric format. Invalid and incomplete records were excluded, including rows with missing key fields or trips where the end time occurred before the start time. 
-- Additional derived variables were created, including ride length in minutes, ride date, ride time, day of week, month, and hour of day, to support behavioral analysis of annual members and casual riders.
