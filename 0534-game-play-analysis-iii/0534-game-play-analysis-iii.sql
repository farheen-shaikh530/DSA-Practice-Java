
Select
a1.player_id,
a1.event_date,
SUM(a2.games_played) as games_played_so_far

from Activity a1
join Activity a2 on a1.player_id = a2.player_id

and a2.event_date <= a1.event_date

group by
a1.player_id, a1.event_date


