Table: Employee 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| employee_name | varchar |
| manager_id    | int     |
+---------------+---------+

DROP TABLE IF EXISTS Employee;
CREATE TABLE IF NOT EXISTS Employee (
	employee_id int,
	employee_name varchar,
	manager_id int
);

INSERT INTO Employee values(1 ,'Boss  ', 1);
INSERT INTO Employee values(3 ,'Alice ', 3);
INSERT INTO Employee values(2 ,'Bob   ', 1);
INSERT INTO Employee values(4 ,'Daniel', 2);
INSERT INTO Employee values(7 ,'Luis  ', 4);
INSERT INTO Employee values(8 ,'Jhon  ', 3);
INSERT INTO Employee values(9 ,'Angela', 8);
INSERT INTO Employee values(77,'Robert', 1);

select 
	distinct employee_id
from 
	(select employee_id from Employee where manager_id = 1
	union 
	select employee_id from Employee where manager_id in (select employee_id from Employee where manager_id = 1)) t
where employee_id != 1
;
