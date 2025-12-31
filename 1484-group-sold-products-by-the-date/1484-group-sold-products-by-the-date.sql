Select sell_date, COUNT(distinct product) as num_sold, 
 Group_concat(Distinct product order by product ASC separator ',') as products
from Activities 
GROUP BY sell_date
order by sell_date

