-- Question 57
-- The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

-- +----+-------+--------+--------------+
-- | Id | Name  | Salary | DepartmentId |
-- +----+-------+--------+--------------+
-- | 1  | Joe   | 70000  | 1            |
-- | 2  | Jim   | 90000  | 1            |
-- | 3  | Henry | 80000  | 2            |
-- | 4  | Sam   | 60000  | 2            |
-- | 5  | Max   | 90000  | 1            |
-- +----+-------+--------+--------------+
-- The Department table holds all departments of the company.

-- +----+----------+
-- | Id | Name     |
-- +----+----------+
-- | 1  | IT       |
-- | 2  | Sales    |
-- +----+----------+
-- Write a SQL query to find employees who have the highest salary in each of the departments. 
-- For the above tables, your SQL query should return the following rows (order of rows does not matter).

-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Max      | 90000  |
-- | IT         | Jim      | 90000  |
-- | Sales      | Henry    | 80000  |
-- +------------+----------+--------+
-- Explanation:

-- Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.

-- Solution
select a.Department, a.Employee, a.Salary
from(
select d.name as Department, e.name as Employee, Salary,
rank() over(partition by d.name order by salary desc) as rk
from employee e
join department d
on e.departmentid = d.id) a
where a.rk=1

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |


DROP TABLE IF EXISTS Employee;
CREATE TABLE IF NOT EXISTS Employee (
	id int,
	name varchar,
	salary int,
	DepartmentId int

);


INSERT INTO Employee values(1,'Joe  ',70000, 1);
INSERT INTO Employee values(2,'Jim  ',90000, 1);
INSERT INTO Employee values(3,'Henry',80000, 2);
INSERT INTO Employee values(4,'Sam  ',60000, 2);
INSERT INTO Employee values(5,'Max  ',90000, 1);

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+

DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department (
	id int,
	name varchar

);
INSERT INTO Department values(1, 'IT   ');
INSERT INTO Department values(2, 'Sales');

select 
	t1.name,
	salary,
	t2.name as department_name
from 
	(select 
		name,
		DepartmentId,
		salary,
		dense_rank() over(partition by DepartmentId order by salary desc) as rn 
	from Employee ) t1 join Department t2 on t1.DepartmentId = t2.id 
where rn = 1
;