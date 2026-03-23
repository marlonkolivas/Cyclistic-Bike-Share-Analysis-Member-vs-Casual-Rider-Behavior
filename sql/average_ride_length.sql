-- AVERAGE RIDE LENGTH
SELECT
    member_casual,
    ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length,
    MIN(ride_length_minutes) AS min_ride,
    MAX(ride_length_minutes) AS max_ride
FROM cyclistic_trips_final
GROUP BY member_casual;

-- What this tells you
	-- How long each group rides on average

-- Interpretation (typical pattern)
	-- Casual riders → longer rides
	-- Members → shorter rides

-- Insight
	-- Members = utility (commuting)
	-- Casual = leisure (longer trips)