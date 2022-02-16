WITH cte AS (
SELECT player_id, result, match_day,
ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY match_day) AS rnk
FROM matches ),
# Segregation of consecutive wins into separate groups for each player_id identified by group_id
temp AS (
SELECT player_id,
rnk - ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY match_day) AS group_id
FROM cte
WHERE result = 'Win')

SELECT pl.player_id, IFNULL(MAX(ct.cnt),0) as longest_streak
FROM (SELECT DISTINCT player_id FROM matches) pl
LEFT JOIN
(SELECT player_id, group_id, COUNT(*) as cnt FROM temp GROUP BY 1, 2) ct
ON pl.player_id = ct.player_id
GROUP BY 1
