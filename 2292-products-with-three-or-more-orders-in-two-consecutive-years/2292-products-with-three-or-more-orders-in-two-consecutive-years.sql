with yearly_orders as(
    select product_id,
    YEAR(purchase_date) as purchase_year,
    COUNT(*) as order_count
    from Orders
    group by product_id, YEAR(purchase_date)
    having count(*) >= 3
)

select distinct y1.product_id
from yearly_orders y1
join yearly_orders y2

on y1. product_id = y2.product_id
and
y2.purchase_year = y1.purchase_year + 1;