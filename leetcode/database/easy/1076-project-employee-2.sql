Table: Project

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+


Table: Employee
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
Question: Write an SQL query that reports all the projects that have the most employees.

select 
	project_id
from 
(select 
	project_id,
	count(*) as emp_count
from Project
group by 1) t 
order by emp_count desc 
limit 1