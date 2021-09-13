# First cte, calculate the running total salaries of 'Senior' and 'Junior' seperately
WITH Cum_salaries AS (
    SELECT employee_id, experience, 
    SUM(salary) OVER(PARTITION BY experience ORDER BY salary, employee_id) AS cum_salary, 
    RANK() OVER(PARTITION BY experience ORDER BY salary, employee_id) AS rk
    FROM Candidates
    ),
# Second cte, try to hire the most number of senior by find the max running total less than $70,000
Senior_part AS (
    SELECT 'Senior' AS experience, 70000-IFNULL(MAX(cum_salary), 0) AS left_salary, IFNULL(MAX(rk), 0) AS accepted_candidates
    FROM Cum_salaries 
    WHERE experience = 'Senior' 
        AND cum_salary <= 70000
),
# Third cte, hire themax number of junior by find the max running total salary less than ($70,000 - senionr salary)
Junior_part AS (
    SELECT 'Junior' AS experience, COUNT(cum_salary) AS accepted_candidates
    FROM Cum_salaries
    WHERE experience = 'Junior'
        AND cum_salary <= (SELECT left_salary FROM Senior_part)
)

# Finally, union them!
SELECT experience, accepted_candidates
FROM Senior_part
UNION 
SELECT experience, accepted_candidates
FROM Junior_part
