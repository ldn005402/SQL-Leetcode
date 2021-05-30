SELECT user_id, MAX(wd) AS biggest_window FROM
(SELECT u1.user_id, 
        MIN(DATEDIFF(IFNULL(u2.visit_date, '2021-1-1'), u1.visit_date)) AS wd
FROM UserVisits AS u1
LEFT JOIN UserVisits AS u2 ON u1.user_id = u2.user_id AND u1.visit_date < u2.visit_date
GROUP BY 1, u1.visit_date) AS u
GROUP BY 1
ORDER BY 1
