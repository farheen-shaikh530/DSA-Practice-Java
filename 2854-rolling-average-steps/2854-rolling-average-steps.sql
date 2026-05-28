WITH cte as(
    Select
    user_id,
    steps_date,
    steps_count,

    LAG(steps_date, 1) OVER (
        PARTITION BY user_id
        ORDER BY steps_date
    ) as prev_date1,

    LAG(steps_date, 2) OVER (
        PARTITION BY user_id
        ORDER BY steps_date  
    ) as prev_date2,

    AVG(steps_count) OVER (
        PARTITION BY user_id
        ORDER BY steps_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW 
    ) as rolling_average

    from Steps
)

SELECT 
user_id,
steps_date,
ROUND(rolling_average, 2) as rolling_average
from cte
where DATEDIFF(steps_date, prev_date1 ) = 1
and DATEDIFF(prev_date1, prev_date2 ) = 1
order by 
user_id, steps_date



