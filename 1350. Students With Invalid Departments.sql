select students.id, students.name
from students
left join departments on students.department_id = departments.id
where departments.id is null
