select seller_name
from seller
where seller_id not in (select distinct seller_id
                        from orders
                        where left(sale_date, 4) = '2020')
order by 1
