WITH CTE AS(
SELECT *, RANK() OVER(PARTITION BY customer_id ORDER BY order_type) AS my_rank
FROM Orders
)
SELECT order_id, customer_id, order_type
FROM CTE
WHERE my_rank = 1
