select product_name, sum(unit) as unit
from products p 
join orders o using(product_id)
where order_Date between '2020-02-01' and '2020-02-29'
group by product_name
having sum(unit) >= 100
