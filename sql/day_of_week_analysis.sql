-- DAY OF WEEK ANALYSIS
SELECT
    member_casual,
    day_num,
    day_of_week,
    COUNT(*) AS total_rides
FROM cyclistic_trips_final
GROUP BY member_casual, day_num, day_of_week
ORDER BY member_casual, day_num;

-- What to look for
	-- Members → weekday concentration
	-- Casual → weekend spikes

-- Interpretation
	-- Members likely use bikes for work/commuting
	-- Casual riders use bikes for recreation