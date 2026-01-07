Select 'Low Salary' as category,
SUM(income < 20000) AS accounts_count
from accounts

UNION ALL

Select 'Average Salary' as category,
SUM(income between 20000 and 50000) AS accounts_count
from accounts

UNION ALL
Select 'High Salary' as category,
SUM(income > 50000) AS accounts_count
from accounts


