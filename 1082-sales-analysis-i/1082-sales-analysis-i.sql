select
seller_id
from 
(
select 
seller_id, 
sum(price) as  Totalsales,
RANK() over  (order by sum(price) desc 
) r
 from sales 
 group by seller_id
) t
WHERE r = 1; 



