select s1.product_id, 
s1.quantity,
s1.year as first_year,
s1.price
from Sales s1

join(
select product_id, MIN(year) AS first_year
 from Sales group by product_id

)
as f
on s1.product_id = f.product_id
 AND s1.year = f.first_year;



