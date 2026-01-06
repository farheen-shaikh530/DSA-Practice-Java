# Write your MySQL query statement below
Select employee_id,
department_id

from Employee

where primary_flag = 'Y' 
or employee_id in(
Select employee_id from Employee Group by employee_id having count(*) = 1
)

