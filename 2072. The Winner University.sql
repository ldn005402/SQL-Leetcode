SELECT
  (CASE 
    WHEN California > NewYork THEN "California University"
    WHEN California < NewYork THEN "New York University"
  ELSE "No Winner" END)
  AS winner     
FROM 
(SELECT COUNT(student_id) AS NewYork FROM NewYork WHERE score >= 90) N,
(SELECT COUNT(student_id) AS California FROM California WHERE score >= 90) C
