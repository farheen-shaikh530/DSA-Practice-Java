With friendship as (
SELECT user1_id, user2_id
From Friendship 
UNION 
Select user2_id, user1_id
From Friendship
), 

common_friend as (
    select
f1.user1_id,
f2.user1_id as user2_id,

COUNT(*) as common_friend

from friendship f1
join friendship f2

 ON f1.user2_id = f2.user2_id
 AND f1.user1_id < f2.user1_id
 GROUP BY f1.user1_id, f2.user1_id
   HAVING COUNT(*) >= 3



)

select cf.user1_id,  cf.user2_id, cf.common_friend


FROM common_friend cf

JOIN friendship f

    ON cf.user1_id = f.user1_id

   AND cf.user2_id = f.user2_id;
