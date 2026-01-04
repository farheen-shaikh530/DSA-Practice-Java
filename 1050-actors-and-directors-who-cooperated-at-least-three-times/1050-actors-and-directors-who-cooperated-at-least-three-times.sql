# Write your MySQL query statement below
Select actor_id, director_id
from ActorDirector
where timestamp is not null
group by actor_id, director_id
Having Count(*)>=3