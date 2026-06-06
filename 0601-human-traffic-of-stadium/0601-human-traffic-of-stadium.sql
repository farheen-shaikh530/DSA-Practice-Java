# Write your MySQL query statement below
with filtered as(

    select id, 
    visit_date, 
    people,

    id - ROW_NUMBER() OVER (Order by id) as group_id

    from Stadium

    where people >= 100

),

valid_group as (
    select group_id
    from filtered
    group by group_id

    having count(*) >= 3

)

select id, 
visit_date,
people
from filtered
where group_id in(
    select group_id 
    from valid_group


)

order by visit_date;

