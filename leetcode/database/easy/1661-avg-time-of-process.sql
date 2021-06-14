Table: Activity
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| machine_id     | int     |
| process_id     | int     |
| activity_type  | enum    |
| timestamp      | float   |
+----------------+---------+

DROP TABLE IF EXISTS Activity;
CREATE TABLE IF NOT EXISTS Activity (
	machine_id int,
	process_id varchar,
	activity_type varchar,
	timestamp float
);


INSERT INTO Activity values(0,0,'start',0.712);
INSERT INTO Activity values(0,0,'end  ',1.520);
INSERT INTO Activity values(0,1,'start',3.140);
INSERT INTO Activity values(0,1,'end  ',4.120);
INSERT INTO Activity values(1,0,'start',0.550);
INSERT INTO Activity values(1,0,'end  ',1.550);
INSERT INTO Activity values(1,1,'start',0.430);
INSERT INTO Activity values(1,1,'end  ',1.420);
INSERT INTO Activity values(2,0,'start',4.100);
INSERT INTO Activity values(2,0,'end  ',4.512);
INSERT INTO Activity values(2,1,'start',2.500);
INSERT INTO Activity values(2,1,'end  ',5.000);

First Solution:
----------------

select 
	t1.machine_id,
	round((sum(t2.timestamp - t1.timestamp)/ count(t1.process_id)) :: numeric, 3) as avg
from Activity t1, Activity t2 
where t1.machine_id = t2.machine_id
and t1.process_id = t2.process_id
and t1.activity_type = 'start'
and t2.activity_type = 'end  '
group by 1
;

Second Solution:
---------------------
select 
	machine_id,
	round((sum(case when activity_type='start' then -timestamp else timestamp end)*1.0/count(distinct process_id))::numeric,3)
from Activity
group by 1
;