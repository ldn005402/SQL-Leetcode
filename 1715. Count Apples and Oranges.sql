select sum(b.apple_count) + ifnull(sum(c.apple_count),0) as apple_count, sum(b.orange_count) + ifnull(sum(c.orange_count),0) as orange_count
from boxes b
left join chests c using(chest_id)
