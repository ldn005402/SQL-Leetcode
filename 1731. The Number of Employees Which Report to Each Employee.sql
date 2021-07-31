SELECT e2.employee_id AS employee_id, e2.name AS name, COUNT(*) AS reports_count, ROUND(AVG(e1.age),0) AS average_age
FROM employees e1
JOIN employees e2 ON e1.reports_to = e2.employee_id
GROUP BY 1
ORDER BY 1
