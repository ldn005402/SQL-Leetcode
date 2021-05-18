select e1.employee_id
from employees as e1, 
     employees as e2,
     employees as e3
where e1.manager_id = e2.employee_id
  and e2.manager_id = e3.employee_id
  and e3.manager_id = 1
  and e1.employee_id != 1
