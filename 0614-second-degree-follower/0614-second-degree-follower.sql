SELECT f2.follower,
       COUNT(DISTINCT f1.follower) AS num
FROM follow f1
JOIN follow f2
ON f1.followee = f2.follower
GROUP BY f2.follower
ORDER BY f2.follower;