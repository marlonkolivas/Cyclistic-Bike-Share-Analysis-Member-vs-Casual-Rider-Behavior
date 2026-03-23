-- INSPECT CLEAN TABLE, CHECK SIMPLE STATS AND SEE TOTAL RIDES FOR EACH MEMBER TYPE

SELECT *
FROM cyclistic_trips_clean
LIMIT 10;

SELECT
    MIN(ride_length_minutes) AS min_ride,
    MAX(ride_length_minutes) AS max_ride,
    AVG(ride_length_minutes) AS avg_ride
FROM cyclistic_trips_clean;

SELECT member_casual, COUNT(*) AS total_rides
FROM cyclistic_trips_clean
GROUP BY member_casual;