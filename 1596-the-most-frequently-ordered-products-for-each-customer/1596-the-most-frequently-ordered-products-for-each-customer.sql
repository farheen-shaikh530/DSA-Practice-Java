WITH ProductFreq as
(
select
o.product_id,
o.customer_id,
p.product_name,
COUNT(*) as freq

from Orders o
left join Products p
     on p.product_id = o.product_id

group by 
p.product_name,
o.customer_id,
o.product_id
),

RankedProducts as (

    select 
    customer_id,
    product_id,
    product_name,
    freq,

    RANK() OVER(
 Partition by customer_id
    order by freq desc
    ) as rn
from ProductFreq)

select 
customer_id,
product_id,
product_name

From RankedProducts

where rn = 1;



