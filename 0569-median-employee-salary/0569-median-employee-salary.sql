WITH rank_number as(
Select
id,
company,
salary,
 ROW_NUMBER() OVER(

  partition by company
  order by salary, id

) as rn,
count(*) over(
    partition by company

) as total_count


from Employee

)
select
id,
company,
salary

from rank_number
where rn in (

    FLOOR((total_count + 1)/2),
    FLOOR((total_count + 2)/2)

);


