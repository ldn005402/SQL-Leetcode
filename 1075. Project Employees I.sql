select project.project_id, round(avg(experience_years), 2) as average_years
from employee
left join project on project.employee_id = employee.employee_id
group by project_id
order by project_id
