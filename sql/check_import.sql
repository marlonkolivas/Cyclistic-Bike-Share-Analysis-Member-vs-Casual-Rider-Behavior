-- CHECK EACH IMPORTED TABLE 

-- Just to confirm if monthly table imported correctly
USE cyclistic_case_study;

SELECT *
FROM feb_2026
LIMIT 10;

SELECT COUNT(*) AS total_rows
FROM feb_2026;

DESCRIBE feb_2026;
