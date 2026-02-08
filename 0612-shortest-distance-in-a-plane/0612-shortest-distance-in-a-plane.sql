Select
ROUND(
MIN( 
    SQRT(
    POW(p1.x - p2.x, 2) +
    POW(p1.y - p2.y, 2))
),
2
)

 as shortest

from Point2D p1
join Point2D p2 
on (p1.x < p2.x)
 OR (p1.x = p2.x AND p1.y < p2.y);





