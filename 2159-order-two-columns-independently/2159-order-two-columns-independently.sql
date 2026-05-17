WITH CTE1 as(
    select first_col,
    Row_number() over (order by first_col asc) as rn
    from Data

),

 cte2 as (
select second_col,
Row_number() over (order by second_col desc) as rn
from Data

)

select cte1.first_col,
cte2.second_col
from cte1

join cte2
on cte1.rn =   cte2.rn 
