Select
d.name as Department,
e.name as Employee,
e.salary as Salary

from Employee e 
join Department d 
    on d.id = e.departmentId

where
 e.salary in(
    Select max(salary) from Employee
    where departmentId = e.departmentId
 )

