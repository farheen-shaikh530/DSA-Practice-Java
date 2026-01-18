Select CASE
when id % 2 = 1 and ID = (Select Max(ID) from Seat ) then id
when id % 2 then id + 1

else id - 1
end as id, student

from Seat
order by id;



