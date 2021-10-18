Select candidate_id
From Candidates c
Join Rounds r on c.interview_id = r.interview_id
Where years_of_exp >= 2
Group by r.interview_id
Having sum(score) > 15
