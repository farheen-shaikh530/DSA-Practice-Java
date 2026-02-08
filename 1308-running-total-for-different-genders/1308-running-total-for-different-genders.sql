Select
gender,
day,

SUM(score_points) 
over (Partition by gender
order by day
)

as total


from Scores 

group by day, gender
order by  gender,day asc

