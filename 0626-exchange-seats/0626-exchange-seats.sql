SELECT

CASE 

WHEN id % 2 = 1
AND id != (Select  MAX(id) From Seat)
THEN id + 1

WHEN id % 2 = 0 
THEN id - 1

ELSE id 
END AS id, 

Student

From Seat 
Order by id;