Select 
machine_id,
ROUND(
AVG(CASE when activity_type = 'end' THEN timestamp END) -
AVG(Case when activity_type = 'start' THEN timestamp END),3
) as processing_time


from Activity
group by machine_id
