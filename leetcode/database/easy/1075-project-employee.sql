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

select 
	project_id,
	round(avg(experience_years), 2)
from Project t1 left join Employee t2 on t1.employee_id = t2.employee_id
group by 1

