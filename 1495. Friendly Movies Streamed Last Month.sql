SELECT DISTINCT c.title
FROM content c
JOIN tvprogram p
ON c.content_id = p.content_id
WHERE c.kids_content = 'Y'
AND c.content_type = 'movies'
AND month(p.program_Date) = 6
AND year(p.program_date) = 2020
