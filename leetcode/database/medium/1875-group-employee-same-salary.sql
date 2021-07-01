Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
| salary      | int     |
+-------------+---------+


DROP TABLE IF EXISTS Employee;
CREATE TABLE IF NOT EXISTS Employee (
	employee_id int,
	name varchar,
	salary int
);


INSERT INTO Employee values(2,'Meir   ',3000);
INSERT INTO Employee values(3,'Michael',3000);
INSERT INTO Employee values(7,'Addilyn',7400);
INSERT INTO Employee values(8,'Juan   ',6100);
INSERT INTO Employee values(9,'Kannon ',7400);

First Solution:
------------------
select 
	employee_id,
	name,
	salary,
	dense_rank() over(order by salary asc) as rank
from 
(select 
	distinct t1.employee_id,
	t1.name,
	t1.salary
from Employee t1 join Employee t2 
on t1.salary = t2.salary 
and t1.employee_id != t2.employee_id) t 
;

Second Solution:
---------------------


select 
	employee_id,
	name,
	salary,
	dense_rank() over(order by salary) as rank 
from Employee 
where salary not in (select salary from Employee group by 1 having count(*) <= 1)
;
