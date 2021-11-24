SELECT COUNT( distinct customer_id) AS rich_count
FROM Store
WHERE amount > 500
