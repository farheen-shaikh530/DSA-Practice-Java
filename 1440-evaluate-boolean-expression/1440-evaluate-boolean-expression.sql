Select left_operand,
operator,
right_operand,

CASE 

WHEN e.operator = '=' AND v1.value = v2.value THEN 'true'

WHEN e.operator = '<' AND v1.value < v2.value THEN 'true'

WHEN e.operator = '>' AND v1.value > v2.value THEN 'true'
ELSE 'false'
END AS value


FROM Expressions e
join Variables v1 on v1.name = e.left_operand
join Variables v2 on v2.name = e.right_operand

