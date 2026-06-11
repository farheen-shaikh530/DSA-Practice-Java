select
product_id,
year as first_year,
quantity,
price

from Sales

where (product_id, year) IN  (

    Select 
    product_id,
    MIN(year)
    FROM Sales

    group by product_id
)