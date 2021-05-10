select product.product_id, product_name
from product
left join sales on product.product_id = sales.product_id
group by product.product_id
having min(sale_date) >= '2019-01-01' and max(sale_date) <= '2019-03-31'
