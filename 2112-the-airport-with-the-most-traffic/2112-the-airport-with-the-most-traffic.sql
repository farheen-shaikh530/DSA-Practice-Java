WITH traffic AS
(
Select departure_airport as airport_id,
               SUM(flights_count) AS total_traffic
from Flights
group by departure_airport

UNION ALL

select arrival_airport as airport_id,
SUM(flights_count) as total_traffic
from Flights
group by arrival_airport
),

airport_traffic as (

    Select airport_id,
    SUM(total_traffic) as traffic
    FROM traffic

    GROUP BY airport_id

)

Select airport_id
from airport_traffic
WHERE
traffic = (
    Select max(traffic) from airport_traffic

);