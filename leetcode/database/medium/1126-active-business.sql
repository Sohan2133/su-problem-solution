Table: Events
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| business_id   | int     |
| event_type    | varchar |
| occurences    | int     | 
+---------------+---------+

DROP TABLE IF EXISTS Events;
CREATE TABLE IF NOT EXISTS Events (
	business_id int,
	event_type varchar,
	occurences int
);


INSERT INTO Events values(1,'reviews   ', 7);
INSERT INTO Events values(3,'reviews   ', 3);
INSERT INTO Events values(1,'ads       ', 11);
INSERT INTO Events values(2,'ads       ', 7);
INSERT INTO Events values(3,'ads       ', 6);
INSERT INTO Events values(1,'page views', 3);
INSERT INTO Events values(2,'page views', 1);

First Solution:
----------------------------

select 
	distinct business_id
from 
	(select 
		event_type,
		avg(occurences) avg_occ
	from Events
	group by 1 
	having count(*) > 1) t1 join Events t2
on t1.event_type = t2.event_type and t1.avg_occ < t2.occurences
;         

Second Solution:
----------------------------
select 
	business_id
from 
	(select 
		*,
		avg(occurences) over(partition by event_type) as avg_occ
	from Events) t 
where occurences > avg_occ
group by business_id
having count(*) > 1
;
