SELECT
  DISTINCT C1.user_id
FROM
  Confirmations C1
  INNER JOIN Confirmations C2 
  ON C1.user_id = C2.user_id
    AND C1.time_stamp != C2.time_stamp
    AND C2.time_stamp 
      BETWEEN C1.time_stamp AND DATE_ADD(C1.time_stamp, INTERVAL 1 DAY);
