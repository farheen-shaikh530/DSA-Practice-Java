Select person_name

from 
(Select person_name, SUM(weight) over (order by turn) as TotalWeight from Queue

)t
 where TotalWeight <= 1000
 order by TotalWeight desc
 limit 1;


