
select distinct
l.page_id as recommended_page
from Friendship f

join Likes l
on (f.user1_id = 1 and f.user2_id = l.user_id)
or (f.user2_id = 1 and f.user1_id = l.user_id)

where l.page_id not in(
    select page_id from Likes where user_id = 1
)

ORDER BY recommended_page;
