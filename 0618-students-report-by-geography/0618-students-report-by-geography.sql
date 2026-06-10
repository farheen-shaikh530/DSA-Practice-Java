Select
MAX(CASE WHEN continent = 'America' THEN name END ) as America,
MAX(CASE WHEN continent = 'Asia' THEN name END) as Asia,
MAX(CASE WHEN continent = 'Europe' THEN name END) as Europe

from (

    Select 
    name, 
    continent,
    ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name) as rn
from Student
    
) t

Group by rn
ORDER BY rn

