SELECT a.id, MAX(b.month) AS month, SUM(b.salary) AS salary
FROM employee a, employee b
WHERE a.id = b.id 
AND b.month BETWEEN (a.month - 3) AND (a.month - 1)
GROUP BY a.id, a.month
ORDER BY id, month DESC
