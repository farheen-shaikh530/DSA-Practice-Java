WITH Daily_Amount as(
Select
visited_on,
SUM(amount) as amount
from Customer
group by visited_on
),

MovingAverage AS (
select 
visited_on,
SUM(amount) OVER(
Order by visited_on

ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) as amount,

ROUND(

    AVG(amount) OVER(

        order by visited_on
        Rows between 6 PRECEDING AND CURRENT ROW
    ), 2



) as average_amount,

Row_number() over (

    order by visited_on
) as rn 
from Daily_Amount
)

Select visited_on,
amount,
average_amount
from MovingAverage

where rn >= 7
order by visited_on;

