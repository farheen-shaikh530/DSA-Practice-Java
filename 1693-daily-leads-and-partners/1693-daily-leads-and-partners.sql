# Write your MySQL query statement below
Select 
date_id, 
make_name,

COUNT(Distinct lead_id) as unique_leads,
COUNT(Distinct partner_id)  as unique_partners

from DailySales
group by make_name, date_id