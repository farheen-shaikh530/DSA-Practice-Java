with cte as(

    select log_id,
    log_id - ROW_NUMBER() OVER (order by log_id) as grp

    from Logs
)

select min(log_id) as start_id,
max(log_id) as end_id 

from cte 
group by grp
ORDER BY start_id
