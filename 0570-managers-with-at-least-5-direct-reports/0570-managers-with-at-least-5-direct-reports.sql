Select 
e1.name

from Employee e1
join Employee e2 on e1.managerId = e2.id

group by e1.managerId, e1.id
having count(*) >= 5
