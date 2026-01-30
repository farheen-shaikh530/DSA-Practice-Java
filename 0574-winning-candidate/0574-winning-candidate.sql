Select  min(c.name) as name
from Candidate c
join Vote v on c.id = v.candidateId
group by c.id, c.name
ORDER BY COUNT(*) DESC
limit 1