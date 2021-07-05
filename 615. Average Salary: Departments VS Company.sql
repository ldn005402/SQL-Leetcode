SELECT DISTINCT pay_month, department_id,
(CASE WHEN department_avg_salary > company_avg_salary THEN 'higher'
      WHEN department_avg_salary < company_avg_salary THEN 'lower'
      WHEN department_avg_salary = company_avg_salary THEN 'same' END) as comparison
FROM (SELECT a.employee_id, amount, pay_date, department_id, left(pay_date,7) as pay_month,
AVG(amount) OVER(PARTITION BY a.pay_Date) as company_avg_salary,
AVG(amount) OVER(PARTITION BY a.pay_Date, b.department_id) as department_avg_salary
FROM salary as a
JOIN employee as b
ON a.employee_id = b.employee_id) as temp
