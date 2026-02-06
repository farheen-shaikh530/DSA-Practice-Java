Select
s.buyer_id

from Sales s
join Product p on p.product_id = s.product_id
group by    s.buyer_id

Having  
SUM(p.product_name = 'S8') >  0
and 
SUM(p.product_name= 'iPhone') = 0;


