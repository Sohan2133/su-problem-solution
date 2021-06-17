
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

INSERT INTO Activity values(1, 2, '2016-03-01', 5);
INSERT INTO Activity values(1, 2, '2016-05-02', 6);
INSERT INTO Activity values(1, 3, '2017-06-25', 1);
INSERT INTO Activity values(3, 1, '2016-03-02', 0);
INSERT INTO Activity values(3, 4, '2018-07-03', 5);



select 
	t1.player_id,
	t1.event_date,
	sum(t2.games_played)
from Activity t1 join Activity t2 on t1.player_id = t2.player_id and t1.event_date >= t2.event_date
group by 1,2
order by 1,2 asc;