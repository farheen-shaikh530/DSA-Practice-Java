WITH rank_type as (
select 
    c.first_name,
    ca.type,
    ca.duration,

    ROW_NUMBER() OVER(
    PARTITION BY ca.type 
    order by ca.duration desc,
             c.first_name desc
) as rn

from Contacts c
join Calls ca 
    on c.id = ca.contact_id
) 

select 
first_name,
type,
TIME_FORMAT(SEC_TO_TIME(duration), '%H:%i:%s') as duration_formatted

from rank_type 

where rn <= 3
order by 

type desc,
duration desc,
first_name desc
