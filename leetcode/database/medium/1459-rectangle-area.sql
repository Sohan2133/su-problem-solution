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
	
from Points t1, Points t2 
where t1.id != t2.id 

