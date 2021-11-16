-- Question 85
-- Table: Project

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | project_id  | int     |
-- | employee_id | int     |
-- +-------------+---------+
-- (project_id, employee_id) is the primary key of this table.
-- employee_id is a foreign key to Employee table.
-- Table: Employee

-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | employee_id      | int     |
-- | name             | varchar |
-- | experience_years | int     |
-- +------------------+---------+
-- employee_id is the primary key of this table.
 

-- Write an SQL query that reports the most experienced employees in each project. 
-- In case of a tie, report all employees with the maximum number of experience years.

-- The query result format is in the following example:

-- Project table:
-- +-------------+-------------+
-- | project_id  | employee_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- | 1           | 2           |
-- | 1           | 3           |
-- | 2           | 1           |
-- | 2           | 4           |
-- +-------------+-------------+

-- Employee table:
-- +-------------+--------+------------------+
-- | employee_id | name   | experience_years |
-- +-------------+--------+------------------+
-- | 1           | Khaled | 3                |
-- | 2           | Ali    | 2                |
-- | 3           | John   | 3                |
-- | 4           | Doe    | 2                |
-- +-------------+--------+------------------+

-- Result table:
-- +-------------+---------------+
-- | project_id  | employee_id   |
-- +-------------+---------------+
-- | 1           | 1             |
-- | 1           | 3             |
-- | 2           | 1             |
-- +-------------+---------------+
-- Both employees with id 1 and 3 have the 
-- most experience among the employees of the first project. For the second project, the employee with id 1 has the most experience.

-- Solution
with t1 as(
select p.project_id, p.employee_id, e.experience_years,
rank() over(partition by project_id order by experience_years desc) as rk
from project p
join employee e
on p.employee_id = e.employee_id)

select t1.project_id, t1.employee_id
from t1
where t1.rk = 1
---------------------------------------------------------

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