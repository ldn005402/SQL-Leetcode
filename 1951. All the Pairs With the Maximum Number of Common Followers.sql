with cte as (
select
r1.user_id user1,
r2.user_id user2,
count(*) as count_followers
from relations r1
join relations r2 on r1.follower_id = r2.follower_id and r1.user_id < r2.user_id
group by 1, 2)

select
cte1.user1 as user1_id,
cte1.user2 as user2_id
from cte cte1
join (select max(count_followers) as max_followers from cte) cte2
where cte1.count_followers >= cte2.max_followers
