-- MONTHLY OR SEASONAL TRENDS 
SELECT
    member_casual,
    month_num,
    month_name,
    COUNT(*) AS total_rides
FROM cyclistic_trips_final
GROUP BY member_casual, month_num, month_name
ORDER BY member_casual, month_num;

-- What to look for
	-- Casual riders → strong summer peaks
	-- Members → more stable usage year-round

-- Interpretation
	-- Casual riders are weather-dependent
	-- Members are habit-driven
