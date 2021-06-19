Table : Project 
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+

DROP TABLE IF EXISTS Project;
CREATE TABLE IF NOT EXISTS Project (
	project_id int,
	employee_id int
);


INSERT INTO Project values(1, 1);
INSERT INTO Project values(1, 2);
INSERT INTO Project values(1, 3);
INSERT INTO Project values(2, 1);
INSERT INTO Project values(2, 4);

Table : Employee 
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+

DROP TABLE IF EXISTS Employee;
CREATE TABLE IF NOT EXISTS Employee (
	employee_id int,
	name varchar,
	experience_years int
);


INSERT INTO Employee values(1, 'Khaled',3);
INSERT INTO Employee values(2, 'Ali   ',2);
INSERT INTO Employee values(3, 'John  ',3);
INSERT INTO Employee values(4, 'Doe   ',2);


select 
	project_id,
	employee_id
from 
	(select 
		project_id,
		t1.employee_id,
		rank() over(partition by project_id order by experience_years desc) rank  
	from Project t1 join Employee t2 on t1.employee_id = t2.employee_id
	) t 
where rank = 1