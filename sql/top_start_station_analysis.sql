-- STATION ANALYSIS (TOP START STATION )
SELECT
    member_casual,
    start_station_name,
    COUNT(*) AS total_rides
FROM cyclistic_trips_final
WHERE start_station_name <> 'Unknown'
GROUP BY member_casual, start_station_name
ORDER BY member_casual, total_rides DESC;

-- What to look for
	-- Casual → tourist / recreational areas
	-- Members → residential / business areas
