SELECT
id,
CASE
WHEN p_id IS NULL THEN 'Root'
WHEN id IN (SELECT DISTINCT p_id FROM Tree WHERE p_id is not null) THEN
'Inner'

ELSE 'Leaf'
END AS type
FROM Tree