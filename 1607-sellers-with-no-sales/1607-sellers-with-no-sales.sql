select s.seller_name
from Seller s

left  join Orders o on s.seller_id = o.seller_id

and YEAR(o.sale_date) = 2020

WHERE o.order_id IS NULL
ORDER BY s.seller_name;