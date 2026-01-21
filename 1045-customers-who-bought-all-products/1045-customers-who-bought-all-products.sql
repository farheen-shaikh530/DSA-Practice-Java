select customer_id
from Customer 
group by customer_id

HAVING COUNT(DISTINCT product_key ) = (SELECT COUNT(*) FROM Product);
  