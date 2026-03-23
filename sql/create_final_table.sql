-- CREATING FINAL TABLE FOR ANALYSIS

DROP TABLE IF EXISTS cyclistic_trips_final;

CREATE TABLE cyclistic_trips_final AS
SELECT
    ride_id,
    rideable_type,
    started_at_dt,
    ended_at_dt,

    CASE
        WHEN start_station_name IS NULL OR TRIM(start_station_name) = '' THEN 'Unknown'
        ELSE start_station_name
    END AS start_station_name,

    CASE
        WHEN start_station_id IS NULL OR TRIM(start_station_id) = '' THEN 'Unknown'
        ELSE start_station_id
    END AS start_station_id,

    CASE
        WHEN end_station_name IS NULL OR TRIM(end_station_name) = '' THEN 'Unknown'
        ELSE end_station_name
    END AS end_station_name,

    CASE
        WHEN end_station_id IS NULL OR TRIM(end_station_id) = '' THEN 'Unknown'
        ELSE end_station_id
    END AS end_station_id,

    start_lat_num,
    start_lng_num,
    end_lat_num,
    end_lng_num,

    member_casual,
    ride_length_minutes,
    ride_date,
    ride_time,
    day_of_week,
    day_num,
    month_name,
    month_num,
    hour_of_day

FROM cyclistic_trips_clean
WHERE ride_length_minutes > 0
  AND ride_length_minutes <= 1440;