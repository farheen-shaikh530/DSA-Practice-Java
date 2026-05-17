WITH RECURSIVE RecursiveHierarchy AS (

    SELECT employee_id

    FROM Employees

    WHERE employee_id = 1

    UNION

    SELECT e.employee_id

    FROM Employees e

    JOIN RecursiveHierarchy rh

        ON e.manager_id = rh.employee_id

)

SELECT employee_id

FROM RecursiveHierarchy

WHERE employee_id <> 1;