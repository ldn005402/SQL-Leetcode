
with frds as (
    select user1_id, user2_id 
    from friendship 
    union all
    select user2_id, user1_id 
    from friendship
)
select a.user1_id, a.user2_id, count(*) as common_friend
from friendship a
inner join frds b  -- user1's friend
on a.user1_id = b.user1_id and a.user2_id != b.user2_id  -- to avoid count user2 itself as a common friend
inner join frds c  -- user2's friend
on a.user2_id = c.user2_id and b.user2_id = c.user1_id  -- keep the common friend
group by a.user1_id, a.user2_id 
having count(*) >= 3;
