Select
'Low Salary' AS category,
SUM(CASE WHEN income < 20000 Then 1 else 0 END) AS accounts_count
FROM Accounts

UNION ALL

Select 
'Average Salary' AS category,
SUM(CASE WHEN income BETWEEN 20000 AND 50000 Then 1 else 0 END) AS accounts_count
FROM Accounts


UNION ALL

Select 
'High Salary' AS category,
SUM(CASE WHEN income > 50000 Then 1 else 0 END) AS accounts_count
FROM Accounts




