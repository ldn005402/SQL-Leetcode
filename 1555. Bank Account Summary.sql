
SELECT user_id, user_name, (credit - IFNULL(out_cash, 0) + IFNULL(in_cash, 0)) AS credit,
IF((credit - IFNULL(out_cash, 0) + IFNULL(in_cash, 0)) < 0, 'Yes', 'No') AS credit_limit_breached
FROM Users U
LEFT JOIN (SELECT paid_by, SUM(amount) AS out_cash
           FROM Transactions
           GROUP BY paid_by) AS out_tmp
     ON U.user_id = out_tmp.paid_by
LEFT JOIN (SELECT paid_to, SUM(amount) AS in_cash
           FROM Transactions
           GROUP BY paid_to) AS in_tmp 
     ON U.user_id = in_tmp.paid_to
