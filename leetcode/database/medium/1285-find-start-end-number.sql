Table: Logs
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| log_id        | int     |
+---------------+---------+

DROP TABLE IF EXISTS Logs;
CREATE TABLE IF NOT EXISTS Logs (
	log_id int
);

INSERT INTO Logs values(1 );
INSERT INTO Logs values(2 );
INSERT INTO Logs values(3 );
INSERT INTO Logs values(7 );
INSERT INTO Logs values(8 );
INSERT INTO Logs values(10);

select 
	min(log_id) as start,
	max(log_id) as end
from 
	(select 
		log_id,
		(log_id - row_number) as diff
	from 
		(select 
			log_id,
			row_number() over(order by log_id) row_number
		from Logs) t 
		) t1 
group by diff
order by 1 asc 
;
