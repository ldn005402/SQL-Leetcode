
SELECT id1 AS id, COUNT(id2) AS num
FROM (SELECT requester_id AS id1, accepter_id AS id2
      FROM request_accepted
      UNION
      SELECT accepter_id AS id1, requester_id AS id2
      FROM request_accepted) AS temp
GROUP BY id1
ORDER BY num DESC
LIMIT 1
