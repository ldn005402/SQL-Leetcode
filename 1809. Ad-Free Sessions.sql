SELECT session_id
FROM playback
WHERE session_id NOT IN (
                         SELECT session_id 
                         FROM playback p
                         JOIN ads a
                         ON timestamp BETWEEN start_time and end_time
                         AND p.customer_id = a.customer_id
