Select 
ROUND(
    ifnull(

(SELECT COUNT(DISTINCT CONCAT(requester_id ,'-', accepter_id)  ) FROM RequestAccepted) /

(SELECT COUNT(DISTINCT CONCAT( sender_id ,'-', send_to_id ) ) FROM FriendRequest), 0 ),2)  

AS accept_rate;

