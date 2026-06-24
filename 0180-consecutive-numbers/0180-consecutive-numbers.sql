SELECT DISTINCT
num as ConsecutiveNums
FROM (
    SELECT 
    num,
    LAG(num)  OVER (ORDER BY id) as prev,
    LEAD(num)  OVER (ORDER BY id) as next
    FROM Logs
) t
WHERE num = prev
AND num = next;