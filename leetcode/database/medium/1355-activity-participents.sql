Table: Friends
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
| activity      | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Friends;
CREATE TABLE IF NOT EXISTS Friends (
	id int,
	name varchar,
	activity varchar
);


INSERT INTO Friends values(1,'Jonathan D.','Eating      ');
INSERT INTO Friends values(2,'Jade W.    ','Singing     ');
INSERT INTO Friends values(3,'Victor J.  ','Singing     ');
INSERT INTO Friends values(4,'Elvis Q.   ','Eating      ');
INSERT INTO Friends values(5,'Daniel A.  ','Eating      ');
INSERT INTO Friends values(6,'Bob B.     ','Horse Riding');

Table: Activity 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Activity;
CREATE TABLE IF NOT EXISTS Activity (
	id int,
	name varchar
);


INSERT INTO Activity values(1,'Eating      ');
INSERT INTO Activity values(2,'Singing     ');
INSERT INTO Activity values(3,'Horse Riding');

First Solution:
----------------------------

select 
	activity
from
(
	select 
		activity,
		rank() over(order by c desc) as r_d,
		rank() over(order by c asc) as r_a
	from 
		(select 
			activity,
			count(*) c 
		from Friends
		group by 1
		) t 
) t1 
where r_d > 1 and r_a > 1 
;

Second Solution (without aggregate function):
--------------------------------------------

select 
	activity
from Friends
group by activity
having count(*) not in  ((select count(*) from Friends group by activity order by 1 desc limit 1)
						union 
						(select count(*) from Friends group by activity order by 1 asc limit 1))
;
















