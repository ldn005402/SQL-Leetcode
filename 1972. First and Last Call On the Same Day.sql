WITH t AS (
    SELECT caller_id, recipient_id, call_time
    FROM calls
    
    UNION
    
    SELECT recipient_id AS caller_id, caller_id AS recipient_id, call_time
    FROM calls
),

target_time AS (
    SELECT 
        caller_id, 
        LEFT(call_time, 10) AS call_date, 
        MIN(call_time) AS min_time, 
        MAX(call_time) AS max_time
    FROM
        t
    GROUP BY 1, 2
),

first_rec AS (
    SELECT t.caller_id, LEFT(call_time, 10) AS call_date, recipient_id
    FROM t
    INNER JOIN target_time
    ON t.caller_id = target_time.caller_id
    AND t.call_time = target_time.min_time
),

last_rec AS (
    SELECT t.caller_id, LEFT(call_time, 10) AS call_date, recipient_id
    FROM t
    INNER JOIN target_time
    ON t.caller_id = target_time.caller_id
    AND t.call_time = target_time.max_time
)

SELECT DISTINCT first_rec.caller_id AS user_id
FROM first_rec
INNER JOIN last_rec
ON first_rec.caller_id = last_rec.caller_id
AND first_rec.call_date = last_rec.call_date
AND first_rec.recipient_id = last_rec.recipient_id
