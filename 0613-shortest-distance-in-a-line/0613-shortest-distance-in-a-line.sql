select 
MIN(p2.x - p1.x) as shortest
FROM Point p1
join Point p2
on p2.x = (
    Select MIN(x)
    from Point
    where x > p1.x
);

