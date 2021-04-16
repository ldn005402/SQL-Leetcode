SELECT name as warehouse_name,
       SUM(units * Width * Length * Height) as volume
FROM Warehouse W
LEFT JOIN Products P ON W.product_id = P.product_id
GROUP BY name
