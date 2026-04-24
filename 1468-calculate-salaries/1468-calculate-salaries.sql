With company_max as(
    select 
    company_id,
    MAX(salary) AS max_salary
    from Salaries 
    group by company_id
)


Select 
s.company_id,
s.employee_id,
s.employee_name,

CASE 

WHEN max_salary < 1000 then ROUND(s.salary)
WHEN max_salary <= 10000 Then ROUND(s.salary * 0.76)
WHEN max_salary > 10000 Then ROUND(s.salary * 0.51)

end as salary

from Salaries s
join company_max c 
on s.company_id = c.company_id;

