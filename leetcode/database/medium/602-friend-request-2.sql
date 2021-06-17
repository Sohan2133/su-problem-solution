Table: request_accepted
+--------------+-------------+------------+
| requester_id | accepter_id | accept_date|
|--------------|-------------|------------|
| 1            | 2           | 2016_06-03 |
| 1            | 3           | 2016-06-08 |
| 2            | 3           | 2016-06-08 |
| 3            | 4           | 2016-06-09 |
+--------------+-------------+------------+

DROP TABLE IF EXISTS request_accepted;
CREATE TABLE IF NOT EXISTS request_accepted (
	requester_id int,
	accepter_id int,
	accept_date date 
);


INSERT INTO request_accepted values(1, 2,'2016_06-03');
INSERT INTO request_accepted values(1, 3,'2016-06-08');
INSERT INTO request_accepted values(3, 1,'2016-06-08');
INSERT INTO request_accepted values(2, 3,'2016-06-08');
INSERT INTO request_accepted values(3, 4,'2016-06-09');

select 
	user1 as id,
	count(*) as num
from 
	(select requester_id as user1, accepter_id as user2 from request_accepted
	union 
	select accepter_id as user1 , requester_id as user2 from request_accepted)t
group by user1 
order by 2 desc limit 1 
;