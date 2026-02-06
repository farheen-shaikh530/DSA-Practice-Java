Select distinct product_id,
SUM(CASE when store = 'store1' then price else null end) as store1,
SUM(CASE when store = 'store2' then price else null end) as store2,
SUM(CASE when store = 'store3' then price else null end) as store3

from Products


group by product_id