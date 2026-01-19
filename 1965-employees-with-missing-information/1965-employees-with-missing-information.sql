SELECT employee_id
FROM Employees 
where employee_id not in (SELECT employee_id FROM Salaries)


UNION ALL

SELECT employee_id
FROM Salaries 
where employee_id not in (SELECT employee_id FROM Employees)

ORDER BY employee_id;