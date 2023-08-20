+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

expected Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null

CREATE TABLE IF NOT EXISTS Employee(
    Id int PRIMARY KEY,
    Salary int
);

INSERT INTO Employee(Id, Salary) VALUES (1,100);
INSERT INTO Employee(Id, Salary) VALUES (2,200);
INSERT INTO Employee(Id, Salary) VALUES (4,200);
INSERT INTO Employee(Id, Salary) VALUES (5,300);
INSERT INTO Employee(Id, Salary) VALUES (6,300);

First solution:
------------------------

select 
	Salary as secondHighestSalary
from
(
	select 
		distinct Salary
	from Employee
	order by Salary
	desc
	limit 2
)t
order by Salary
asc 
limit 1;

Second solution:
---------------------

select
	(select 
		distinct Salary
	from Employee
	order by Salary desc 
	offset 1
	limit 1
	)as secondHighestSalary