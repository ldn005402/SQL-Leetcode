
SELECT s.user_id, ROUND(IFNULL(SUM(action = "confirmed") / COUNT(action),0),2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c on c.user_id = s.user_id
GROUP BY s.user_id
