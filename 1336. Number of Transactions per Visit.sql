WITH t AS (SELECT v.user_id as user_id, visit_date, count(t.transaction_date) as transaction_count
            FROM Visits v LEFT JOIN Transactions t on v.visit_date = t.transaction_date and v.user_id=t.user_id
            GROUP BY 1, 2),

    row_nums AS (SELECT ROW_NUMBER() OVER () as rn 
                 FROM Transactions 
                 UNION 
                 SELECT 0) 
				 
SELECT row_nums.rn as transactions_count, count(t.transaction_count) as visits_count
FROM t RIGHT JOIN row_nums ON transaction_count = rn
WHERE rn <= (SELECT MAX(transaction_count) FROM t)
GROUP BY rn
ORDER BY 1
