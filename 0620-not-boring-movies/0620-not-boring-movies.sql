
select id, movie, description, rating

from Cinema

where description <> 'boring'
 and MOD(id,2)<>0

ORDER BY rating DESC, id ASC;