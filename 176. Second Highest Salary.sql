Select max(salary) as SecondHighestSalary
From employee
Where salary Not In (Select max(salary)
                     From employee)
