SELECT 
    Request_at AS Day,
    ROUND(AVG(CASE WHEN Status != 'completed' THEN 1 ElSE 0 END), 2) AS 'Cancellation Rate'
FROM 
    Trips
WHERE
    Client_Id NOT IN (SELECT Users_ID FROM Users WHERE Banned = "Yes")
    AND
    Driver_Id NOT IN (SELECT Users_ID FROM Users WHERE Banned = "Yes")
    AND
    Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY
    Request_at;
