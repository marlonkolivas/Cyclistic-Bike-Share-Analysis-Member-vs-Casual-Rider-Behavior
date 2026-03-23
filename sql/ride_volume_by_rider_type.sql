--  RIDE VOLUME BY RIDER TYPE
SELECT
    member_casual,
    COUNT(*) AS total_rides,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM cyclistic_trips_final
GROUP BY member_casual;

-- What this tells you
	-- Which group uses the service more frequently
	-- The proportion of rides by each group

-- Interpretation (example)
	-- Members typically account for more rides → consistent usage
	-- Casual riders → lower volume but different usage patterns