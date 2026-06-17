SELECT DISTINCT
user_id
FROM(

    SELECT 
    user_id,
    purchase_date,
    LAG(purchase_date) OVER (

        PARTITION BY user_id
        ORDER by purchase_date

    ) as prev_purchase
    from Purchases




) p

WHERE DATEDIFF (purchase_date, prev_purchase ) <= 7;