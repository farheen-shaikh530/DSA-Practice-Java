Select
LEAST(from_id, to_id) as person1,
GREATEST(from_id, to_id ) as person2,
COUNT(*) as call_count,
SUM(duration) as total_duration

from Calls


GROUP by
LEAST(from_id,to_id),
GREATEST(from_id, to_id )

