Table: Employee
+---------------+---------+
| Column Name   |  Type   |
+---------------+---------+
| employee_id   | int     |
| department_id | int     |
| primary_flag  | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Employee;
CREATE TABLE IF NOT EXISTS Employee (
	employee_id int,
	department_id int,
	primary_flag varchar
);


INSERT INTO Employee values(1, 1, 'N');
INSERT INTO Employee values(2, 1, 'Y');
INSERT INTO Employee values(2, 2, 'N');
INSERT INTO Employee values(3, 3, 'N');
INSERT INTO Employee values(4, 2, 'N');
INSERT INTO Employee values(4, 3, 'Y');
INSERT INTO Employee values(4, 4, 'N');

First Solution:
--------------------

select 
	t1.employee_id,
	-- case when t2.employee_id is not null t2.employee_id else t1.employee_id end employee_id,
	t1.department_id
from 
	Employee t1 left join 
	(select 
		employee_id
	from Employee
	group by 1
	having count(*) = 1) t2 on t1.employee_id = t2.employee_id
where t2.employee_id is not null
or t1.primary_flag = 'Y'

Second Solution:
-----------------------

select 
	employee_id,
	department_id
from Employee 
where primary_flag = 'Y' 
or employee_id in (
	select 
		employee_id
	from Employee
	group by 1 
	having count(*) = 1
)
