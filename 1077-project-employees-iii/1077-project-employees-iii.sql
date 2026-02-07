# Write your MySQL query statement below
select 
p.project_id,
e.employee_id
from Employee e
join Project p 
on
 e.employee_id = p.employee_id

where e.experience_years = (

    select max(e2.experience_years)
    from Project p2
    join Employee e2 on p2.employee_id = e2.employee_id
    where p2.project_id = p.project_id

)



