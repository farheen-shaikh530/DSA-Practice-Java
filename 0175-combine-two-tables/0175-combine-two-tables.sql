
 Select
 p.firstName,
 p.lastName,
 a.city,
 a.state

 from Person P

LEFT JOIN Address a

 ON p.personId = a.personId

