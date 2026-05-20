select 
max(salary) as SecondHighestSalary
from Employee
where salary not in (Select max(salary) from Employee)
