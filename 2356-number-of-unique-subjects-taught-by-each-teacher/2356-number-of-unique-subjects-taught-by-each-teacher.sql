Select 
teacher_id,
COUNT(Distinct subject_id) as cnt
From Teacher
Group by teacher_id

