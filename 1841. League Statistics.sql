# Write your MySQL query statement below

SELECT t1.*, goal_for - goal_against AS goal_diff 
FROM 
    (SELECT
        team_name,
        SUM(team_id IN (away_team_id, home_team_id)) AS matches_played,
        SUM(CASE 
            WHEN team_id = away_team_id AND home_team_goals > away_team_goals  THEN 0 
            WHEN team_id = away_team_id AND home_team_goals < away_team_goals  THEN 3 
            WHEN team_id = home_team_id AND home_team_goals > away_team_goals  THEN 3 
            WHEN team_id = home_team_id AND home_team_goals < away_team_goals  THEN 0
            ELSE 1
            END) AS points,
        SUM(CASE 
            WHEN team_id = away_team_id THEN away_team_goals 
            WHEN team_id = home_team_id THEN home_team_goals  
            ELSE 0
            END) AS goal_for,
        SUM(CASE 
            WHEN team_id = away_team_id THEN home_team_goals 
            WHEN team_id = home_team_id THEN away_team_goals  
            ELSE 0
            END) AS goal_against
    FROM Matches m 
        JOIN Teams ON (team_id IN (away_team_id, home_team_id))
    GROUP BY team_id
 ) AS t1 
ORDER BY points DESC, goal_diff DESC, team_name ASC
