select user_id, 
Concat(
    Upper(left(name,1)),
    LOWER(Substring(name,2))
)as name
from Users
ORDER BY user_id;