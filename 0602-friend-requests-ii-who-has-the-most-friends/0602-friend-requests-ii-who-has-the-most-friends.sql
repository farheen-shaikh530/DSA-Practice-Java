SELECT
id,
 COUNT(*) as num
 from (
    SELECT requester_id as id
    from RequestAccepted

    UNION ALL

    SELECT accepter_id as id
    from RequestAccepted

 ) t
 GROUP by id
 ORDER by num desc
 LIMIT 1;

