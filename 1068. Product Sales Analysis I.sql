select p.product_name, s.year, s.price
from Sales as s
left join product as p on p.product_id = s.product_is
