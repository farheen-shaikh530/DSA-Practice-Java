Select 
d.dept_name,
(COUNT(s.student_name)) as student_number

from Department d 

left join Student s on s.dept_id = d.dept_id
group by d.dept_name
ORDER BY student_number DESC, d.dept_name;