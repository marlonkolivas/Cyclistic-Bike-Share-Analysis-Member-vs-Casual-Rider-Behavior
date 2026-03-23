-- DATA VALIDATION PASS 

-- Check the total number of rows
SELECT COUNT(*) AS total_rows
FROM cyclistic_trips_final;

-- Check missing value in critical fields 
SELECT
    SUM(CASE WHEN ride_id IS NULL OR TRIM(ride_id) = '' THEN 1 ELSE 0 END) AS missing_ride_id,
    SUM(CASE WHEN rideable_type IS NULL OR TRIM(rideable_type) = '' THEN 1 ELSE 0 END) AS missing_rideable_type,
    SUM(CASE WHEN started_at_dt IS NULL THEN 1 ELSE 0 END) AS missing_started_at,
    SUM(CASE WHEN ended_at_dt IS NULL THEN 1 ELSE 0 END) AS missing_ended_at,
    SUM(CASE WHEN member_casual IS NULL OR TRIM(member_casual) = '' THEN 1 ELSE 0 END) AS missing_member_casual,
    SUM(CASE WHEN ride_length_minutes IS NULL THEN 1 ELSE 0 END) AS missing_ride_length,
    SUM(CASE WHEN ride_date IS NULL THEN 1 ELSE 0 END) AS missing_ride_date,
    SUM(CASE WHEN day_of_week IS NULL OR TRIM(day_of_week) = '' THEN 1 ELSE 0 END) AS missing_day_of_week,
    SUM(CASE WHEN month_name IS NULL OR TRIM(month_name) = '' THEN 1 ELSE 0 END) AS missing_month_name,
    SUM(CASE WHEN hour_of_day IS NULL THEN 1 ELSE 0 END) AS missing_hour_of_day
FROM cyclistic_trips_final;

-- Check in for duplicates in ride_id
SELECT ride_id, COUNT(*) AS duplicate_count
FROM cyclistic_trips_final
GROUP BY ride_id
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS duplicate_ride_ids
FROM (
    SELECT ride_id
    FROM cyclistic_trips_final
    GROUP BY ride_id
    HAVING COUNT(*) > 1
) d;

-- Check whether member_casual contains only expected values
SELECT member_casual, COUNT(*) AS total_rides
FROM cyclistic_trips_final
GROUP BY member_casual;

-- Summary Stats
SELECT
    MIN(ride_length_minutes) AS min_ride,
    MAX(ride_length_minutes) AS max_ride,
    AVG(ride_length_minutes) AS avg_ride
FROM cyclistic_trips_final;

-- Check negative or zero durations
SELECT COUNT(*) AS invalid_ride_lengths
FROM cyclistic_trips_final
WHERE ride_length_minutes <= 0;

-- Check very long rides
SELECT COUNT(*) AS rides_over_24_hours
FROM cyclistic_trips_final
WHERE ride_length_minutes > 1440;

-- Check datetime logic directly
SELECT COUNT(*) AS bad_time_order
FROM cyclistic_trips_final
WHERE ended_at_dt <= started_at_dt;

-- Check day and month consistency
SELECT day_num, day_of_week, COUNT(*) AS total_rides
FROM cyclistic_trips_final
GROUP BY day_num, day_of_week
ORDER BY day_num;

-- Check month numbers
SELECT month_num, month_name, COUNT(*) AS total_rides
FROM cyclistic_trips_final
GROUP BY month_num, month_name
ORDER BY month_num;

-- Check bike type consistency
SELECT rideable_type, COUNT(*) AS total_rides
FROM cyclistic_trips_final
GROUP BY rideable_type
ORDER BY total_rides DESC;

SELECT
    SUM(CASE WHEN start_station_name IS NULL OR TRIM(start_station_name) = '' THEN 1 ELSE 0 END) AS missing_start_name,
    SUM(CASE WHEN end_station_name IS NULL OR TRIM(end_station_name) = '' THEN 1 ELSE 0 END) AS missing_end_name,
    SUM(CASE WHEN start_station_id IS NULL OR TRIM(start_station_id) = '' THEN 1 ELSE 0 END) AS missing_start_id,
    SUM(CASE WHEN end_station_id IS NULL OR TRIM(end_station_id) = '' THEN 1 ELSE 0 END) AS missing_end_id
FROM cyclistic_trips_final;

SELECT
    SUM(CASE WHEN start_station_name = 'Unknown' THEN 1 ELSE 0 END) AS unknown_start_name,
    SUM(CASE WHEN end_station_name = 'Unknown' THEN 1 ELSE 0 END) AS unknown_end_name,
    SUM(CASE WHEN start_station_id = 'Unknown' THEN 1 ELSE 0 END) AS unknown_start_id,
    SUM(CASE WHEN end_station_id = 'Unknown' THEN 1 ELSE 0 END) AS unknown_end_id
FROM cyclistic_trips_final;

-- Check coordinate quality
SELECT
    SUM(CASE WHEN start_lat_num IS NULL THEN 1 ELSE 0 END) AS missing_start_lat,
    SUM(CASE WHEN start_lng_num IS NULL THEN 1 ELSE 0 END) AS missing_start_lng,
    SUM(CASE WHEN end_lat_num IS NULL THEN 1 ELSE 0 END) AS missing_end_lat,
    SUM(CASE WHEN end_lng_num IS NULL THEN 1 ELSE 0 END) AS missing_end_lng
FROM cyclistic_trips_final;

-- Check coordinate ranges 
SELECT
    MIN(start_lat_num) AS min_start_lat,
    MAX(start_lat_num) AS max_start_lat,
    MIN(start_lng_num) AS min_start_lng,
    MAX(start_lng_num) AS max_start_lng,
    MIN(end_lat_num) AS min_end_lat,
    MAX(end_lat_num) AS max_end_lat,
    MIN(end_lng_num) AS min_end_lng,
    MAX(end_lng_num) AS max_end_lng
FROM cyclistic_trips_final;

-- Check whether your final table is analysis-ready in one QA summary
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT ride_id) AS distinct_ride_ids,
    SUM(CASE WHEN ride_id IS NULL OR TRIM(ride_id) = '' THEN 1 ELSE 0 END) AS missing_ride_id,
    SUM(CASE WHEN member_casual IS NULL OR TRIM(member_casual) = '' THEN 1 ELSE 0 END) AS missing_member_type,
    SUM(CASE WHEN ride_length_minutes IS NULL THEN 1 ELSE 0 END) AS missing_ride_length,
    SUM(CASE WHEN ride_length_minutes <= 0 THEN 1 ELSE 0 END) AS invalid_ride_length,
    SUM(CASE WHEN ended_at_dt <= started_at_dt THEN 1 ELSE 0 END) AS invalid_time_order
FROM cyclistic_trips_final;