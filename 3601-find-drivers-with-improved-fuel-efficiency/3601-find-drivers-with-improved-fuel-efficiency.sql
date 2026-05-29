WITH trip_efficiency AS (

    SELECT

        d.driver_id,

        d.driver_name,

        CASE 

            WHEN MONTH(t.trip_date) BETWEEN 1 AND 6 THEN 'first_half'

            ELSE 'second_half'

        END AS period,

        t.distance_km / t.fuel_consumed AS efficiency

    FROM Drivers d 

    JOIN Trips t

        ON d.driver_id = t.driver_id

),

avg_efficiency AS (

    SELECT 

        driver_id,

        driver_name,

        period,

        AVG(efficiency) AS avg_eff

    FROM trip_efficiency 

    GROUP BY driver_id, driver_name, period

)

SELECT

    f.driver_id,

    f.driver_name,

    ROUND(f.avg_eff, 2) AS first_half_avg,

    ROUND(s.avg_eff, 2) AS second_half_avg,

    ROUND(s.avg_eff - f.avg_eff, 2) AS efficiency_improvement

FROM avg_efficiency f

JOIN avg_efficiency s

    ON f.driver_id = s.driver_id

WHERE f.period = 'first_half'

  AND s.period = 'second_half'

  AND s.avg_eff > f.avg_eff

ORDER BY efficiency_improvement DESC,

         f.driver_name ASC;