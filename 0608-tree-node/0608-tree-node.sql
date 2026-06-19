
Select
id,
CASE 

WHEN p_id is null then 'Root' 
WHEN id IN(
    Select Distinct p_id from Tree Where p_id is not null
) then 'Inner'
else 'Leaf'
END as type 
From Tree;