
WITH product_counts as(
    Select 
    s.user_id,
    s.product_id,
    SUM(s.quantity * p.price) AS total_spent
    From Sales s
    join Product p
    on p.product_id  = s.product_id

    group by 
    s.user_id, s.product_id
),

ranked_products as (
select
user_id,
product_id,
 RANK() OVER (

    partition by user_id
    order by total_spent desc

 ) as rnk
 from product_counts
)

Select user_id,

product_id from ranked_products
where  rnk = 1;

