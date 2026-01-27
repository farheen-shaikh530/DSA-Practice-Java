select p.firstName, p.lastName, a.state, a.city
from Person p

left join Address a
on p.personId = a.personId


 