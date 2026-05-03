WITH all_calls AS (
    SELECT
        caller_id AS user_id,
        recipient_id AS other_user,
        DATE(call_time) AS call_day,
        call_time
    FROM Calls

    UNION ALL

    SELECT
        recipient_id AS user_id,
        caller_id AS other_user,
        DATE(call_time) AS call_day,
        call_time
    FROM Calls
),

ranked_calls AS (
    SELECT
        user_id,
        other_user,
        call_day,
        ROW_NUMBER() OVER (
            PARTITION BY user_id, call_day
            ORDER BY call_time
        ) AS first_call,
        ROW_NUMBER() OVER (
            PARTITION BY user_id, call_day
            ORDER BY call_time DESC
        ) AS last_call
    FROM all_calls
)

SELECT DISTINCT f.user_id
FROM ranked_calls f
JOIN ranked_calls l
    ON f.user_id = l.user_id
   AND f.call_day = l.call_day
WHERE f.first_call = 1
  AND l.last_call = 1
  AND f.other_user = l.other_user;