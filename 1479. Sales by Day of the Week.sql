select i.item_category as Category, 
    sum(case when dayofweek(o.order_date) = 2 then quantity else 0 end) as Monday,
    sum(case when dayofweek(o.order_date) = 3 then quantity else 0 end) as Tuesday,
    sum(case when dayofweek(o.order_date) = 4 then quantity else 0 end) as Wednesday,
    sum(case when dayofweek(o.order_date) = 5 then quantity else 0 end) as Thursday,
    sum(case when dayofweek(o.order_date) = 6 then quantity else 0 end) as Friday,
    sum(case when dayofweek(o.order_date) = 7 then quantity else 0 end) as Saturday,
    sum(case when dayofweek(o.order_date) = 1 then quantity else 0 end) as Sunday
from items i
left join orders o using(item_id)
group by i.item_category
order by i.item_category
