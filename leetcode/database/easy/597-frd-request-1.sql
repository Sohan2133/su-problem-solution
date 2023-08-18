Table: FriendRequest
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| sender_id      | int     |
| send_to_id     | int     |
| request_date   | date    |
+----------------+---------+
There is no primary key for this table, it may contain duplicates.
This table contains the ID of the user who sent the request, the ID of the user who received the request, 
and the date of the request.

Table: RequestAccepted
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
There is no primary key for this table, it may contain duplicates.
This table contains the ID of the user who sent the request, the ID of the user who received the request, 
and the date when the request was accepted.

Question: Write an SQL query to find the overall acceptance rate of requests, 
which is the number of acceptance divided by the number of requests. Return the answer rounded 
to 2 decimals places.

DROP TABLE IF EXISTS FriendRequest;
CREATE TABLE IF NOT EXISTS FriendRequest (
	sender_id int,
	send_to_id int,
	request_date date
);


DROP TABLE IF EXISTS RequestAccepted;
CREATE TABLE IF NOT EXISTS RequestAccepted (
	requester_id int,
	accepter_id int,
	accept_date date
);

INSERT INTO FriendRequest(sender_id, send_to_id, request_date) VALUES(1 , 2 ,'2016/06/01');
INSERT INTO FriendRequest(sender_id, send_to_id, request_date) VALUES(1 , 3 ,'2016/06/01');
INSERT INTO FriendRequest(sender_id, send_to_id, request_date) VALUES(1 , 4 ,'2016/06/01');
INSERT INTO FriendRequest(sender_id, send_to_id, request_date) VALUES(2 , 3 ,'2016/06/02');
INSERT INTO FriendRequest(sender_id, send_to_id, request_date) VALUES(3 , 4 ,'2016/06/09');

INSERT INTO RequestAccepted(requester_id,accepter_id,accept_date)VALUES(1 , 2, '2016/06/03');
INSERT INTO RequestAccepted(requester_id,accepter_id,accept_date)VALUES(1 , 3, '2016/06/08');
INSERT INTO RequestAccepted(requester_id,accepter_id,accept_date)VALUES(2 , 3, '2016/06/08');
INSERT INTO RequestAccepted(requester_id,accepter_id,accept_date)VALUES(3 , 4, '2016/06/09');
INSERT INTO RequestAccepted(requester_id,accepter_id,accept_date)VALUES(3 , 4, '2016/06/10');

select 
	round(sum(case when t2.requester_id is null then 0 else 1 end)/count(t1.sender_id)::decimal,2) as accept_rate
from
(
	select 
		distinct sender_id,
		send_to_id
	from FriendRequest
) t1 
left join
(
	select 
		distinct requester_id,
		accepter_id
	from RequestAccepted
) t2
on t1.sender_id = t2.requester_id
and t1.send_to_id = t2.accepter_id




t1 left join FriendRequest t2 
on t1.sender_id= t2.requester_id