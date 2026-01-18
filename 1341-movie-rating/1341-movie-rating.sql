(
Select 
u.name as results

from MovieRating mr

join Users u
 on u.user_id = mr.user_id

Group by u.name
order by COUNT(*) desc, u.name asc
LIMIT 1
)

UNION ALL

(Select mv.title as results
from MovieRating mr

JOIN Movies mv on mv.movie_id = mr.movie_id

where created_at between '2020-02-01' AND '2020-02-29'
Group by mv.title
order by avg(mr.rating) desc, mv.title asc
limit 1
);












