select product_id, 10 as price from products
group by product_id
having min(change_date) > '2019-08-16'

union

select t.product_id, t.new_price as price 
from (select *, 
      dense_rank()over(partition by product_id order by change_date desc) as rank 
      from products
      where change_date <= '2019-08-16') as t
where t.rank =1
