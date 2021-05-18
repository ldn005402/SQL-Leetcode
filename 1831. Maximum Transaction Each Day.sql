
SELECT  
	transaction_id
FROM
(
SELECT 
   transaction_id,
   day,
   amount,
   rank() OVER(PARTITION BY date(day) ORDER BY amount DESC) as rnk
FROM
    Transactions
) as t
WHERE rnk =1
ORDER BY 1
