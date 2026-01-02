Select u.name, 
SUM(t.amount) as balance
from Users u
left join Transactions t 
on t.account = u.account

group by u.account
having SUM(t.amount) > 10000