select activity
from (
select activity, count(*) as ac,
max(count(*))over()as max_num,
min(count(*))over()as min_num
from friends
group by activity) as t
where ac not in(max_num, min_num)
