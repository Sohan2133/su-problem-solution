Table: Calls
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| from_id     | int     |
| to_id       | int     |
| duration    | int     |
+-------------+---------+
DROP TABLE IF EXISTS Calls;
CREATE TABLE IF NOT EXISTS Calls (
	from_id int,
	to_id int,
	duration int 
);


INSERT INTO Calls values(1, 2, 59 );
INSERT INTO Calls values(2, 1, 11 );
INSERT INTO Calls values(1, 3, 20 );
INSERT INTO Calls values(3, 4, 100);
INSERT INTO Calls values(3, 4, 200);
INSERT INTO Calls values(3, 4, 200);
INSERT INTO Calls values(4, 3, 499);


select 
	person1,
	person2,
	count(*) as call_count,
	sum(duration) as call_duration
from 
	(select 
		from_id as person1,
		to_id as person2,
		duration
	from Calls 
	union all 
	select 
		to_id as person1,
		from_id as person2,
		duration
	from Calls) t 
where person1 < person2
group by 1,2
;