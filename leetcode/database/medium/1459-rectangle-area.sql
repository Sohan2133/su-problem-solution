Table: Points
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| x_value       | int     |
| y_value       | int     |
+---------------+---------+
DROP TABLE IF EXISTS Points;
CREATE TABLE IF NOT EXISTS Points (
	id int,
	x_value int,
	y_value int
);


INSERT INTO Points values(1, 2, 8 );
INSERT INTO Points values(2, 4, 7 );
INSERT INTO Points values(3, 2, 10);

select
	t1.id as p1,
	t2.id as p2, 
	abs(t1.x_value - t2.x_value)*abs(t1.y_value - t2.y_value) as area
from Points t1, Points t2 
where t1.id < t2.id
and t1.x_value != t2.x_value
and t1.y_value != t2.y_value
order by 3 desc, 1,2 asc 
;

