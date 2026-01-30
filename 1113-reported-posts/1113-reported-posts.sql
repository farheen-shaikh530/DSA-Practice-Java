# Write your MySQL query statement below
select extra as report_reason,

count(DISTINCT post_id) as report_count
from Actions
where action = 'report'

and extra IS NOT NULL
and action_date = '2019-07-04'
group by extra
order by report_count





