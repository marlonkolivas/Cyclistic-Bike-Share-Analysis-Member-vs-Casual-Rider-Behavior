-- INSPECT FINAL TABLE (COUNT ROWS, SUMMARY STATS, COMPARE EACH RIDER TYPES)

SELECT *
FROM cyclistic_trips_final
LIMIT 10;

SELECT
    MIN(ride_length_minutes) AS min_ride,
    MAX(ride_length_minutes) AS max_ride,
    AVG(ride_length_minutes) AS avg_ride
FROM cyclistic_trips_final;

SELECT member_casual, COUNT(*) AS total_rides
FROM cyclistic_trips_final
GROUP BY member_casual;