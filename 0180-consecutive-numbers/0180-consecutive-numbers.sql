Select distinct
num as ConsecutiveNums
from (

    Select 
    num,
    LAG(num, 1) OVER (Order by id)  as prev1,
    LAG(num, 2) OVER (Order by id) as prev2
    from 
    Logs
) as t

where num = prev1 and num = prev2