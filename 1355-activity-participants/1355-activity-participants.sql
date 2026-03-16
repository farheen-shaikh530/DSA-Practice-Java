SELECT activity
FROM Friends
GROUP BY activity
HAVING COUNT(*) > (
        SELECT MIN(cnt)
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Friends
            GROUP BY activity
        ) AS min_table
)
AND COUNT(*) < (
        SELECT MAX(cnt)
        FROM (
            SELECT COUNT(*) AS cnt
            FROM Friends
            GROUP BY activity
        ) AS max_table
);