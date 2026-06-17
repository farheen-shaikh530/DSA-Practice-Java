WITH first_sorted as (
    Select
    first_col,
    ROW_NUMBER() OVER (ORDER BY first_col asc) as rn 
    from Data

),

second_sorted as (
    SELECT
    second_col,
        ROW_NUMBER() OVER (ORDER BY second_col desc) as rn 
        from Data


)

SELECT 
f.first_col,
s.second_col

from first_sorted f
JOIN second_sorted s


ON f.rn = s.rn;
