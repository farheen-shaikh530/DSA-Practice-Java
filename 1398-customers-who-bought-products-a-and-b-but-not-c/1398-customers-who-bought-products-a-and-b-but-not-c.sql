select
 c.customer_id,
c.customer_name
from Orders o

join Customers c ON o.customer_id = c.customer_id

group by o.customer_id, c.customer_name
HAVING
SUM(o.product_name = 'A') > 0
AND SUM(o.product_name = 'B') > 0
AND SUM(o.product_name = 'C') = 0;
