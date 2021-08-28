WITH t1 AS (
    SELECT user1_id AS user_id, user2_id AS friend_id 
    FROM friendship
    
    UNION
    
    SELECT user2_id AS user_id, user1_id AS friend_id 
    FROM friendship)
    
SELECT t1.user_id, l.page_id, COUNT(DISTINCT t1.friend_id) AS friends_likes
FROM t1
LEFT JOIN likes AS l
ON t1.friend_id = l.user_id

left join likes as l2
on t1.user_id=l2.user_id and l.page_id=l2.page_id
where l2.page_id is null

group by t1.user_id, l.page_id

