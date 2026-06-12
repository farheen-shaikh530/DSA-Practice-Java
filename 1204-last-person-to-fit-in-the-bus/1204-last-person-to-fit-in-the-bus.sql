Select
person_name
from
(

    Select 
    person_name,
    SUM(weight) OVER (
        ORDER BY turn 

    ) as total_weight

    from Queue

) q

where total_weight <= 1000
order by total_weight
DESC
limit 1;
