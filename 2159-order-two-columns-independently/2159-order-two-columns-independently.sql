WITH cte1 AS (

    SELECT first_col,

           ROW_NUMBER() OVER (ORDER BY first_col ASC) AS rn

    FROM Data

),

cte2 AS (

    SELECT second_col,

           ROW_NUMBER() OVER (ORDER BY second_col DESC) AS rn

    FROM Data

)

SELECT cte1.first_col,

       cte2.second_col

FROM cte1

JOIN cte2

ON cte1.rn = cte2.rn;