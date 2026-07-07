WITH ranked AS (

    SELECT
    e.*,
    RANK() OVER (PARTITION BY departmentId ORDER BY e.salary DESC) AS rnk
    FROM Employee e


) 
SELECT 
d.name AS Department,
r.name AS Employee,
r.salary AS Salary

FROM ranked r
JOIN Department d ON d.id = r.departmentId

WHERE rnk = 1
