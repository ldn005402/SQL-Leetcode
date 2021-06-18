WITH r2 AS(
SELECT *, CASE WHEN occurences > AVG(occurences) OVER (PARTITION BY event_type) THEN 1 ELSE 0 END AS chosen
FROM Events)

SELECT business_id
FROM r2
GROUP BY business_id
HAVING SUM(chosen) >1;
