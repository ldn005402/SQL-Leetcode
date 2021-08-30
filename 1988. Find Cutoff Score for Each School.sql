select school_id, ifnull(min(score),-1) as score
from schools
left join exam
on capacity >= student_count "join on without same column"
group by school_id
order by school_id
