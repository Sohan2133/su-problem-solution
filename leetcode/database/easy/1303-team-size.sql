+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| team_id       | int     |
+---------------+---------+

DROP TABLE IF EXISTS employee;
CREATE TABLE IF NOT EXISTS employee (
	employee_id int,
	team_id int
);
INSERT INTO employee VALUES(1,8);
INSERT INTO employee VALUES(2,8);
INSERT INTO employee VALUES(3,8);
INSERT INTO employee VALUES(4,7);
INSERT INTO employee VALUES(5,9);
INSERT INTO employee VALUES(6,9);

select 
	t2.employee_id,
	size
from 
	(select 
		team_id,
		count(*) as size
	from employee 
	group by 1) t1 join employee t2 on t1.team_id = t2.team_id
;
