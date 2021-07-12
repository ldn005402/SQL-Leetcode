
SELECT install_dt, COUNT(DISTINCT a1.player_id) AS installs, 
ROUND(SUM(CASE WHEN DATEDIFF(event_date, install_dt) = 1 THEN 1 ELSE 0 END)/
          COUNT(DISTINCT a1.player_id), 2) AS Day1_retention 
FROM
    (
        SELECT player_id, MIN(event_date) AS install_dt
        FROM Activity
        GROUP BY player_id
    ) AS a1
JOIN Activity AS a2
ON a1.player_id = a2.player_id
GROUP BY install_dt
