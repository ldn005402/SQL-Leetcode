Select a.name as 'employee'
From Employee as a, Employee as b

Where a.managerid = b.id
and a.salary >b.salary
