table : employee

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+

DROP TABLE IF EXISTS employee;
CREATE TABLE IF NOT EXISTS employee (
	id int,
	name varchar
);


INSERT INTO employee values(1 ,'Alice   ');
INSERT INTO employee values(7 ,'Bob     ');
INSERT INTO employee values(11,'Meir    ');
INSERT INTO employee values(90,'Winston ');
INSERT INTO employee values(3 ,'Jonathan');

Table : EmployeeUNI
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| unique_id     | int     |
+---------------+---------+

DROP TABLE IF EXISTS EmployeeUNI;
CREATE TABLE IF NOT EXISTS EmployeeUNI (
	id int,
	unique_id int
);

INSERT INTO EmployeeUNI values(3 ,1);
INSERT INTO EmployeeUNI values(11,2);
INSERT INTO EmployeeUNI values(90,3);


select 
	t2.unique_id,
	t1.name
from employee t1 left join EmployeeUNI t2 
on t1.id = t2.id 
;
