    # Write your MySQL query statement below
    Select  e.business_id 
    from Events e join 
    
     (
        select event_type, 
        AVG(occurrences) as avg_occ 
        from Events
        group by  event_type
    ) 
     a

on e.event_type = a.event_type
WHERE e.occurrences > a.avg_occ
GROUP BY e.business_id

HAVING COUNT(DISTINCT e.event_type) >= 2;

