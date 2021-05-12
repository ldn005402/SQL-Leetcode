

select p.product_id, round(sum(s.units * p.price)/sum(s.units),2) as average_price
from prices as p
join unitssold as s on p.product_id = s.product_id
and s.purchase_Date between p.start_date and p.end_date 
group by p.product_id
