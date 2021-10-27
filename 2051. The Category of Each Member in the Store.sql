SELECT a.member_id,a.name,
(
    CASE WHEN (100*COUNT(c.visit_id)/COUNT(b.member_id)) >=80 THEN "Diamond"
    WHEN (100*COUNT(c.visit_id)/COUNT(b.member_id)) >=50 THEN "Gold"
    WHEN (100*COUNT(c.visit_id)/COUNT(b.member_id)) <50 THEN "Silver"
    ELSE "Bronze" END
) as category
FROM Members as a
LEFT JOIN Visits as b
ON a.member_id=b.member_id
LEFT JOIN Purchases as c
ON b.visit_id=c.visit_id
GROUP BY a.member_id
