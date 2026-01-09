CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN

declare off int;
SET off = N - 1;

if N <= 0 then return null;
END if;


RETURN (

Select distinct salary 
from Employee
 order by salary desc 
 limit 1 
 OFFSET off

  );
END