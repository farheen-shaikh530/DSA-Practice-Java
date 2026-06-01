# Write your MySQL query statement below
Select
employee_id,
count(*) over (Partition by team_id) as team_size

from Employee;