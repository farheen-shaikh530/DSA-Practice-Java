WITH monthly_credit AS (
    SELECT 
        t.account_id,
        EXTRACT(YEAR_MONTH FROM t.day) AS month_num,
        SUM(t.amount) AS total_credit,
        a.max_income
    FROM Transactions t
    JOIN Accounts a 
        ON a.account_id = t.account_id
    WHERE t.type = 'Creditor'
    GROUP BY t.account_id, EXTRACT(YEAR_MONTH FROM t.day), a.max_income
)

SELECT DISTINCT m1.account_id
FROM monthly_credit m1
JOIN monthly_credit m2
    ON m1.account_id = m2.account_id
   AND PERIOD_DIFF(m1.month_num, m2.month_num) = 1
WHERE m1.total_credit > m1.max_income
  AND m2.total_credit > m2.max_income
ORDER BY m1.account_id;