WITH UniqueLogins AS (

    SELECT DISTINCT id, login_date

    FROM Logins

),

DateGaps AS (

    SELECT 

        l.id,

        a.name,

        l.login_date,

        DATE_SUB(

            l.login_date, 

            INTERVAL ROW_NUMBER() OVER (

                PARTITION BY l.id

                ORDER BY l.login_date

            ) DAY

        ) AS grp

    FROM UniqueLogins l

    JOIN Accounts a 

        ON a.id = l.id

)  

SELECT DISTINCT

    id,

    name

FROM DateGaps

GROUP BY id, name, grp

HAVING COUNT(*) >= 5

ORDER BY id;