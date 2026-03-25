WITH medals AS (
    SELECT contest_id, gold_medal AS user_id
    FROM Contests
    UNION ALL
    SELECT contest_id, silver_medal AS user_id
    FROM Contests
    UNION ALL
    SELECT contest_id, bronze_medal AS user_id
    FROM Contests
),

consecutive_winners AS (
    SELECT DISTINCT m1.user_id
    FROM medals m1
    JOIN medals m2
        ON m1.user_id = m2.user_id
       AND m2.contest_id = m1.contest_id + 1
    JOIN medals m3
        ON m2.user_id = m3.user_id
       AND m3.contest_id = m2.contest_id + 1
),

gold_winners AS (
    SELECT gold_medal AS user_id
    FROM Contests
    GROUP BY gold_medal
    HAVING COUNT(*) >= 3
)
SELECT DISTINCT u.name, u.mail
FROM Users u

JOIN (
    SELECT user_id FROM consecutive_winners
    UNION
    SELECT user_id FROM gold_winners
) candidates
ON u.user_id = candidates.user_id;