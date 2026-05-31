# Write your MySQL query statement below
with ranks as (

select
name,
continent,

ROW_NUMBER() OVER (
    partition by continent
    order by name
) as rn
from student

) 
select 
MAX(CASE WHEN continent = 'America' then name end ) AS America,
MAX(CASE WHEN continent = 'Asia' then name end ) AS Asia,
MAX(CASE WHEN continent = 'Europe' then name end) AS Europe

from ranks

group by rn
order by rn

