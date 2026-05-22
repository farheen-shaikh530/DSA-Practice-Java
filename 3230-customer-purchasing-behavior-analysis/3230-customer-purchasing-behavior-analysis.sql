with customer_stats as(
Select
t.customer_id,
 ROUND(SUM(t.amount), 2) as total_amount,
COUNT(*) AS transaction_count,
 COUNT(DISTINCT p.category) AS unique_categories,

  ROUND(AVG(t.amount),2) as avg_transaction_amount,

ROUND((COUNT(*) * 10) + (SUM(t.amount) / 100), 2) AS loyalty_score

 from Transactions t
  join Products p
  ON t.product_id = p.product_id

    GROUP BY t.customer_id

    ),
    category_rank as(
        Select 
        t.customer_id,
        p.category,
        count(*) as category_count,
        MAX(t.transaction_date) AS latest_transaction_date,

         ROW_NUMBER() OVER (

             PARTITION BY t.customer_id
             ORDER BY COUNT(*) DESC, MAX(t.transaction_date) DESC

         ) as rn
    FROM Transactions t
    JOIN Products p
    ON t.product_id = p.product_id
    GROUP BY t.customer_id, p.category

    )

    select
    cs.customer_id,
     cs.total_amount,
     cs.transaction_count,
     cs.unique_categories,
     cs.avg_transaction_amount,
      cr.category AS top_category,
      cs.loyalty_score

      FROM customer_stats cs

JOIN category_rank cr

    ON cs.customer_id = cr.customer_id

WHERE cr.rn = 1

ORDER BY cs.loyalty_score DESC, cs.customer_id ASC;
