
WITH tb1 AS (
SELECT order_id,
AVG(quantity) AS avg_quantity,
MAX(quantity) AS max_quantity
FROM OrdersDetails
GROUP BY order_id
)

SELECT order_id
FROM tb1
WHERE max_quantity > (SELECT MAX(avg_quantity) AS max_avg_quantity
FROM tb1)
