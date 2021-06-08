+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+

DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity(
	player_id int,
	device_id int,
	event_date date,
	games_played int
);

Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-05-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+

INSERT INTO Activity(player_id, device_id, event_date, games_played) VALUES(1 ,2 ,'2016-03-01',5);
INSERT INTO Activity(player_id, device_id, event_date, games_played) VALUES(1 ,2 ,'2016-05-02',6);
INSERT INTO Activity(player_id, device_id, event_date, games_played) VALUES(2 ,3 ,'2017-06-25',1);
INSERT INTO Activity(player_id, device_id, event_date, games_played) VALUES(3 ,1 ,'2016-03-02',0);
INSERT INTO Activity(player_id, device_id, event_date, games_played) VALUES(3 ,4 ,'2018-07-03',5);

select 
	t1.player_id,
	t1.device_id
from 
	(select 
		distinct player_id,
		device_id
	from Activity) t1 
	join
	(select 
		player_id,
		min(event_date) as login_date
	from Activity
	group by 1
	)t2
on t1.device_id = t2.player_id
;
