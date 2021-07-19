WITH temp0 AS
(SELECT id, login_date, dense_rank() OVER(PARTITION BY id ORDER BY login_date) as row_num
 FROM Logins),

     temp1 AS 
(SELECT id, login_date, row_num, DATE_ADD(login_date, INTERVAL -row_num DAY) as Groupings
 FROM temp0),

answer_table as (SELECT  id, MIN(login_date) as startDate, MAX(login_date) as EndDate, row_num, Groupings, count(id), datediff(MAX(login_date), MIN(login_date)) as duration
                 FROM temp1
                 GROUP BY id, Groupings
                 HAVING datediff(MAX(login_date), MIN(login_date)) >= 4
                 ORDER BY id, StartDate)
 
SELECT DISTINCT a.id, name
FROM answer_table a
JOIN Accounts acc ON acc.id = a.id
ORDER BY a.id
