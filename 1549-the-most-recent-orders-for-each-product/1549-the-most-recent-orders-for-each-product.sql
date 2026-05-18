WITH order_rank as (
Select
p.product_name,
o.product_id,
o.order_id,
o.order_date,
    RANK() OVER(
Partition by o.product_id
order by o.order_date desc

) as rn

from Orders o
join Products p on p.product_id = o.product_id


)
select product_name,
product_id,
order_id,
order_date
FROM order_rank
WHERE rn = 1

ORDER BY product_name, product_id, order_id;