SELECT Name
FROM Vote 
INNER JOIN Candidate ON Vote.CandidateId = Candidate.id
GROUP BY CandidateId
ORDER BY COUNT(CandidateId) DESC
LIMIT 1
