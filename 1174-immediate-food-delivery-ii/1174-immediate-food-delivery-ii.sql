WITH cte AS (

    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY customer_id
        ORDER BY order_date
    ) as rn
    FROM Delivery

)

SELECT ROUND(

    AVG(
        CASE WHEN order_date = customer_pref_delivery_date
        THEN 1
        ELSE 0
        END
    ) * 100,
    2
) AS immediate_percentage

FROM cte 
WHERE rn = 1;
