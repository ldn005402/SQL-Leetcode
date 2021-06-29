with cte as 
(select t.*
from transactions t
where state = "approved"
union all 
select trans_id, t.country,"back" as state, t.amount,c.trans_date
from chargebacks c left join transactions t on c.trans_id = t.id)

select substr(trans_date,1,7) as month,
country,
sum(state="approved") as approved_count,
sum(case when state = "approved" then amount else 0 end) as approved_amount,
sum(state="back") as chargeback_count,
sum(case when state = "back" then amount else 0 end) as chargeback_amount 
from cte
group by 1,country
