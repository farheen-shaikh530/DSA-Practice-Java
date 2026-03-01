Select 

ROUND( 
    COUNT(Distinct a.player_id) / 
    (Select COUNT(Distinct player_id) from Activity) ,2) as fraction

from activity a

join (Select player_id, MIN(event_date) AS first_login 
FROM Activity
    GROUP BY player_id
) f

ON a.player_id = f.player_id
   AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY);



