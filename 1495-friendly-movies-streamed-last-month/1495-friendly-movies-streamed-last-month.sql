Select distinct c.title as TITLE

from Content c
join TVProgram t on c.content_id = t.content_id

WHERE t.program_date >= '2020-06-01'
AND t.program_date <= '2020-06-30'


 AND c.Kids_content = 'Y'
 and c.content_type = 'Movies'