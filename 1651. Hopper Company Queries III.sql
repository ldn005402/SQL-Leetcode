with recursive cte as (
    select 1 as month
    union all
    select month + 1 from cte where month < 12
) 
select t.month, 
round(avg(cast(ifnull(b.monthly_distance,0) as float))over(order by month rows between current row and 2 following),2) average_ride_distance,
round(avg(cast(ifnull(b.monthly_duration,0) as float))over(order by month rows between current row and 2 following),2) average_ride_duration
from cte t
left join(
    select month(a.requested_at) month, sum(b.ride_distance) monthly_distance, sum(ride_duration) monthly_duration
    from rides a join acceptedrides b on a.ride_id = b.ride_id 
    where year(a.requested_at) = 2020 group by month 
) b on t.month = b.month order by 1 limit 10
