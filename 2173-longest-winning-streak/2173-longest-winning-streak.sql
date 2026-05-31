# Write your MySQL query statement below
WITH Longest_streak as (

Select 
player_id,
match_day,
result,
SUM(
    CASE when result != 'Win'
    then 1
    else 0
    end

    )


OVER(
    Partition by Player_id
    order by match_day

) as grp


from Matches
),

win_streak as(

    select 
    player_id,
    grp,
    count(*) as streak

    from Longest_streak

    where result = 'Win'
    group by player_id, grp


)
select
m.player_id,
    COALESCE(MAX(Streak), 0) as longest_streak
from (select distinct player_id from Matches)

 m
LEFT JOIN win_streak w

on m.player_id = w.player_id
group by m.player_id







