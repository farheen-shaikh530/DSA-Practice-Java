WITH spam_reports as 
(
Select Distinct action_date,post_id
from Actions
where 
action = 'report'
and 
extra = 'spam'
),

daily_percent as(
    select s.action_date,
    100.0 * COUNT(r.post_id) / COUNT(s.post_id) as percent_removed

    from spam_reports s
    left join Removals r

    on s.post_id = r.post_id
    Group by s.action_date

)
SELECT 
ROUND(AVG(percent_removed), 2) AS average_daily_percent
FROM daily_percent;


