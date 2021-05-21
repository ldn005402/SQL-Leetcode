select group_id as GROUP_ID, min(player_id) as PLAYER_ID
from Players,
    (select player, sum(score) as score from
        (select first_player as player, first_score as score from Matches
        union all
        select second_player, second_score from Matches) s
    group by player) PlayerScores
where Players.player_id = PlayerScores.player and (group_id, score) in
	(select group_id, max(score)
	from Players,
		(select player, sum(score) as score from
			(select first_player as player, first_score as score from Matches
			union all
			select second_player, second_score from Matches) s
		group by player) PlayerScores
	where Players.player_id = PlayerScores.player
	group by group_id)
group by group_id
