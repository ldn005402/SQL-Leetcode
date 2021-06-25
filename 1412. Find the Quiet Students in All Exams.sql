WITH cte AS (
             SELECT exam_id, student_id, student_name, score, RANK()OVER(partition by exam_id ORDER BY score) as rk1, RANK()OVER(PARTITION BY exam_id ORDER BY score DESC) rk2
             FROM exam 
             LEFT JOIN student using(student_id)
             )

SELECT DISTINCT student_id, student_name
FROM cte
WHERE student_id NOT IN (SELECT student_id from cte WHERE rk1 =1 or rk2 =1)
ORDER BY student_id
