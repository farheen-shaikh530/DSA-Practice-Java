Select c.name as customer_name,
c.customer_id,
o.order_id,
o.order_date
from( 
    SELECT o.*,
    ROW_NUMBER() over (
Partition By customer_id
order by order_date desc

    ) as rn
from Orders o
) o

Join Customers c
on c.customer_id = o.customer_id

where o.rn <= 3
ORDER BY 
 c.name ASC, c.customer_id ASC, o.order_date DESC












