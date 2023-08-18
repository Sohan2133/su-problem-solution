
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+

DROP TABLE IF EXISTS Weather;
CREATE TABLE IF NOT EXISTS Weather (
	id int,
	recordDate date,
	temperature int
);

+----+------------+-------------+
| id | recordDate | Temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Question: Find all dates Id with higher temperatures compared to its previous dates (yesterday).

INSERT INTO Weather(id, recordDate, temperature) VALUES(1 ,'2015-01-01',10 );
INSERT INTO Weather(id, recordDate, temperature) VALUES(2 ,'2015-01-02',25 );
INSERT INTO Weather(id, recordDate, temperature) VALUES(3 ,'2015-01-03',20 );
INSERT INTO Weather(id, recordDate, temperature) VALUES(4 ,'2015-01-04',30 );

First solution:
--------------------

select 
	t2.id
from 
	(SELECT 
		*,
		date(recordDate + interval '1' day) as next_day
	FROM Weather
	) t1 join Weather t2 on t1.next_day = t2.recordDate
	where t1.temperature < t2.temperature
;

Second solution:
----------------------

select 
	t1.id
from Weather t1 , Weather t2 
where date_part('day', t1.recordDate :: timestamp - t2.recordDate :: timestamp) = 1
and t1.temperature > t2.temperature
;