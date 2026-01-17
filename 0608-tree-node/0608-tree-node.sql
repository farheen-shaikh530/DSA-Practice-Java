select id,
CASE 
WHEN p_id is null then 'Root'
WHEN id IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL)

then 'Inner'
ELSE 'Leaf' 
End as type

from Tree;


