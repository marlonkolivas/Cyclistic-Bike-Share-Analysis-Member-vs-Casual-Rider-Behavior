-- BIKE TYPE PREFERENCE 
SELECT
    member_casual,
    rideable_type,
    COUNT(*) AS total_rides
FROM cyclistic_trips_final
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides DESC;

-- What to look for
	-- Casual riders may favor electric bikes
	-- Members may prefer classic bikes

-- Interpretation
	-- Casual → convenience / experience
	-- Members → routine / efficiency
