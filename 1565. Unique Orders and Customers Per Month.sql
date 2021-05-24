select 
 SUBSTRING(order_date, 1, 7) as month,
 count(distinct order_id) as order_count,
 count(distinct customer_id) as customer_count
from orders
where invoice > 20
group by
SUBSTRING(order_date, 1, 7)
