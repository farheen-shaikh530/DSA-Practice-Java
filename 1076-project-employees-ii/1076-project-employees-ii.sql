select p.project_id
from 
Project p 

join Employee e 
on p.employee_id = e.employee_id

group by p.project_id
having count(*) = (

    SELECT MAX(emp_count)
    FROM (
        SELECT COUNT(*) AS emp_count
        FROM Project p
        JOIN Employee e
          ON p.employee_id = e.employee_id
        GROUP BY p.project_id
    

) t
);

