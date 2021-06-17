+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+

DROP TABLE IF EXISTS Activity;
CREATE TABLE IF NOT EXISTS Activity (
	player_id int,
	device_id int,
	event_date date,
	games_played int

);

INSERT INTO Activity values(1, 2, '2016-03-01',5);
INSERT INTO Activity values(1, 2, '2016-03-02',6);
INSERT INTO Activity values(2, 3, '2017-06-25',1);
INSERT INTO Activity values(3, 1, '2016-03-02',0);
INSERT INTO Activity values(3, 4, '2018-07-03',5);



select 
	round(count(distinct t2.player_id)*1.0 /count(distinct t1.player_id),2)
from Activity t1 left join Activity t2 
on t1.player_id = t2.player_id 
and t1.event_date = date(t2.event_date + interval '1' day)
;