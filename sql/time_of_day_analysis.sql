-- TIME OF DAY ANALYSIS
SELECT
    member_casual,
    hour_of_day,
    COUNT(*) AS total_rides
FROM cyclistic_trips_final
GROUP BY member_casual, hour_of_day
ORDER BY member_casual, hour_of_day;

-- What to look for
	-- Members → peaks at:
	-- morning (7–9 AM)
	-- evening (4–6 PM)
	-- Casual → broader usage throughout the day

-- Interpretation
	-- Members follow commuting patterns
	-- Casual riders follow flexible, leisure schedules