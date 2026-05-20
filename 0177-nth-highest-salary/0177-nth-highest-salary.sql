CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE off int;
SET off = N - 1;

RETURN (
Select distinct salary 
from Employee
order by salary desc
Limit 1 offset off 
);

END