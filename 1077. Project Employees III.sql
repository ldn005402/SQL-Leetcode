with t as (
select p.project_id, p.employee_id, 
rank()over(partition by p.project_id order by experience_years desc) as rk 
from project p
join employee e using (employee_id)
    )

select project_id, employee_id
from t
where rk = 1
