Select 
contest_id, 
ROUND(
    COUNT(Distinct user_id) * 100.0 / (select COUNT(*) from Users),
    2) 

as percentage


FROM  Register 

group by contest_id 
order by percentage desc, contest_id ASC;

