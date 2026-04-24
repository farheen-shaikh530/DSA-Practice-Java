SELECT

    u.user_id,

    u.user_name,

    u.credit

    - COALESCE(sent.total_sent, 0)

    + COALESCE(received.total_received, 0) AS credit,

    CASE

        WHEN (

            u.credit

            - COALESCE(sent.total_sent, 0)

            + COALESCE(received.total_received, 0)

        ) < 0 THEN 'Yes'

        ELSE 'No'

    END AS credit_limit_breached

FROM Users u

LEFT JOIN (

    SELECT 

        paid_by AS user_id,

        SUM(amount) AS total_sent

    FROM Transactions

    GROUP BY paid_by

) sent

ON u.user_id = sent.user_id

LEFT JOIN (

    SELECT 

        paid_to AS user_id,

        SUM(amount) AS total_received

    FROM Transactions

    GROUP BY paid_to

) received

ON u.user_id = received.user_id;