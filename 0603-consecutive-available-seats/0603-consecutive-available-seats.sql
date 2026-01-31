select distinct c1.seat_id

from Cinema c1
join Cinema c2
 on ABS(c1.seat_id - c2.seat_id) = 1
 WHERE c1.free = 1
  AND c2.free = 1
ORDER BY c1.seat_id;
