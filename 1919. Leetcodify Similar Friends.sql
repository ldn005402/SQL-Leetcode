select distinct u.user1_id, u.user2_id 
from Friendship u
inner join Listens me on u.user1_id = me.user_id
inner join Listens fnd on u.user2_id = fnd.user_id 
where me.song_id = fnd.song_id and me.day = fnd.day
group by u.user1_id, u.user2_id, me.day 
having count(distinct me.song_id) >=3
