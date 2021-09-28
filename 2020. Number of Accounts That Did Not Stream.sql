SELECT COUNT(account_id) AS accounts_count 
FROM Subscriptions 
WHERE 
start_date<='2021-12-31' AND end_date >= '2021-01-01' AND 
account_id NOT IN (SELECT account_id FROM Streams WHERE LEFT(stream_date, 4) = '2021')
