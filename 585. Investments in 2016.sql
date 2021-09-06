
SELECT SUM(TIV_2016) TIV_2016
FROM insurance a
WHERE (SELECT COUNT(*) 
       FROM insurance b 
       WHERE a.lat = b.lat
       AND a.lon = b.lon) = 1
AND   (SELECT COUNT(*) 
       FROM insurance c
       WHERE a.TIV_2015 = c.TIV_2015) > 1
