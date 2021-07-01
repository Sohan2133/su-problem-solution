Table: Players 
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| player_id      | int     |
| player_name    | varchar |
+----------------+---------+
DROP TABLE IF EXISTS Players;
CREATE TABLE IF NOT EXISTS Players (
	player_id int,
	player_name varchar
);

INSERT INTO Players values(1,'Nadal  ');
INSERT INTO Players values(2,'Federer');
INSERT INTO Players values(3,'Novak  ');

Table: Championships
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| year          | int     |
| Wimbledon     | int     |
| Fr_open       | int     |
| US_open       | int     |
| Au_open       | int     |
+---------------+---------+
DROP TABLE IF EXISTS Championships;
CREATE TABLE IF NOT EXISTS Championships (
	year int,
	Wimbledon int,
	Fr_open int,
	US_open int,
	Au_open int 
);


INSERT INTO Championships values(2018, 1, 1, 1, 1);
INSERT INTO Championships values(2019, 1, 1, 2, 2);
INSERT INTO Championships values(2020, 2, 1, 2, 2);

First Solution:
--------------------
select
	player_id, 
	player_name,
	sum(total)
from 
(select Wimbledon as player_id, count(*) as total from Championships group by 1
union all 
select Fr_open as player_id, count(*) as total from Championships group by 1
union all
select US_open as player_id, count(*) as total from Championships group by 1
union all 
select Au_open as player_id, count(*) as total from Championships group by 1
) t1 join Players using(player_id)
group by 1,2

Second Solution:
-----------------------
select 
	player_id,
	player_name,
	sum(total)
from 
(select
	year,
	t1.player_id,
	t1.player_name,
	((case when Wimbledon = t1.player_id then 1 else 0 end)
	+ (case when Fr_open = t1.player_id then 1 else 0 end)
	+ (case when US_open = t1.player_id then 1 else 0 end)
	+ (case when Au_open = t1.player_id then 1 else 0 end)) as total 
from Players t1 join Championships t2 
on t1.player_id = t2.Wimbledon 
or t1.player_id = t2.Fr_open 
or t1.player_id = t2.US_open
or t1.player_id = t2.Au_open) t 
group by 1,2
;


















