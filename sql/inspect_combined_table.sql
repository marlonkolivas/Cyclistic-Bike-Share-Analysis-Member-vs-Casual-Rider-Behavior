-- COMBINED TABLE INSPECTIONS

-- Before cleaning, check the most important columns 
SELECT *
FROM cyclistic_trips_raw;

-- Compare rider types 
SELECT member_casual, COUNT(*) AS total
FROM cyclistic_trips_raw
GROUP BY member_casual;

-- Check missing values in core fields
SELECT
    SUM(CASE WHEN ride_id IS NULL OR ride_id = '' THEN 1 ELSE 0 END) AS missing_ride_id,
    SUM(CASE WHEN started_at IS NULL OR started_at = '' THEN 1 ELSE 0 END) AS missing_started_at,
    SUM(CASE WHEN ended_at IS NULL OR ended_at = '' THEN 1 ELSE 0 END) AS missing_ended_at,
    SUM(CASE WHEN member_casual IS NULL OR member_casual = '' THEN 1 ELSE 0 END) AS missing_member_casual
FROM cyclistic_trips_raw;