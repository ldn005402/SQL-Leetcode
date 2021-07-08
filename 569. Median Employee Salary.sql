SELECT id, company, salary
FROM (SELECT*, ROW_NUMBER()OVER(PARTITION BY company Order by salary ASC, id ASC) as rk_asc,
      ROW_NUMBER()OVER(PARTITION BY company Order by salary DESC, id DESC) as rk_desc
      FROM employee
     ) AS temp
WHERE rk_asc BETWEEN rk_desc -1 AND rk_desc + 1
ORDER BY company, salary
