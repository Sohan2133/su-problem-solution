
Table : Departments
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Departments;
CREATE TABLE IF NOT EXISTS Departments (
	id int,
	name varchar
);

Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
| department_id | int     |
+---------------+---------+

First Solution:
---------------------

select 
	id,
	name  
from Students t1 left join Departments t2 
on t1.department_id = t2.id
where t2.id is null  

Second Solution:
-----------------------

select 
	id,
	name 
from Students 
where department_id not in (select id from Departments)
;
