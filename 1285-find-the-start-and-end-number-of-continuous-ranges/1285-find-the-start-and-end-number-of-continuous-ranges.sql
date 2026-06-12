WITH cte as (

    Select
    log_id,
    log_id - ROW_NUMBER() OVER  (
        ORDER BY log_id

    ) as grp

    FROM Logs


)


Select
MIN(log_id) as start_id,
MAX(log_id) as end_id

FROM cte

Group by grp
Order by start_id;