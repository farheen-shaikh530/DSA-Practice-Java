Select  
month,
country,
    SUM(CASE WHEN type = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(CASE WHEN type = 'approved' then amount else 0 end) as approved_amount,
    SUM(CASE WHEN type = 'chargeback' then 1 else 0 end) as chargeback_count,
    SUM(CASE WHEN type = 'chargeback' then amount else 0 end) as chargeback_amount

from (
    select 
    DATE_FORMAT(trans_date, '%Y-%m') as month,
    country,
    amount, 
   'approved' as type 
   
from Transactions WHERE state = 'approved'

    UNION ALL

    select 
    DATE_FORMAT(c.trans_date, '%Y-%m') as month,
    t.country,
    t.amount,
    'chargeback' as type from Chargebacks c
     join Transactions t on c.trans_id = t.id

) x

group by month, country
ORDER BY month, country;



