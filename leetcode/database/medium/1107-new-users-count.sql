Table : Traffic
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| activity      | enum    |
| activity_date | date    |
+---------------+---------+

DROP TABLE IF EXISTS Traffic;
CREATE TABLE IF NOT EXISTS Traffic (
	user_id int,
	activity varchar,
	activity_date date
);


INSERT INTO Traffic values(1,'login   ','2019-05-01');
INSERT INTO Traffic values(1,'homepage','2019-05-01');
INSERT INTO Traffic values(1,'logout  ','2019-05-01');
INSERT INTO Traffic values(2,'login   ','2019-06-21');
INSERT INTO Traffic values(2,'logout  ','2019-06-21');
INSERT INTO Traffic values(3,'login   ','2019-01-01');
INSERT INTO Traffic values(3,'jobs    ','2019-01-01');
INSERT INTO Traffic values(3,'logout  ','2019-01-01');
INSERT INTO Traffic values(4,'login   ','2019-06-21');
INSERT INTO Traffic values(4,'groups  ','2019-06-21');
INSERT INTO Traffic values(4,'logout  ','2019-06-21');
INSERT INTO Traffic values(5,'login   ','2019-03-01');
INSERT INTO Traffic values(5,'logout  ','2019-03-01');
INSERT INTO Traffic values(5,'login   ','2019-06-21');
INSERT INTO Traffic values(5,'logout  ','2019-06-21');


select 
	activity_date,
	count(*)
from 
	(select 
		*,
		row_number() over(partition by user_id order by activity_date asc) as rn 
	from Traffic
	where activity = 'login   ') t 
where activity_date >= date '2019-06-30' - integer '90'
and rn = 1
group by 1 
;