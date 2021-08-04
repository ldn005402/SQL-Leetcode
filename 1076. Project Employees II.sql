WITH cte AS (SELECT project_id, COUNT(employee_id) AS ct
             FROM project p
             GROUP BY project_id
            )
SELECT project_id
FROM cte
WHERE cte.ct = (SELECT MAX(ct)
                FROM cte)
