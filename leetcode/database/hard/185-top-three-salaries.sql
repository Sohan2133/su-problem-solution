-- Question 14
-- The Employee table holds all employees. Every employee has an Id, and there is also a column for the department Id.

-- +----+-------+--------+--------------+
-- | Id | Name  | Salary | DepartmentId |
-- +----+-------+--------+--------------+
-- | 1  | Joe   | 85000  | 1            |
-- | 2  | Henry | 80000  | 2            |
-- | 3  | Sam   | 60000  | 2            |
-- | 4  | Max   | 90000  | 1            |
-- | 5  | Janet | 69000  | 1            |
-- | 6  | Randy | 85000  | 1            |
-- | 7  | Will  | 70000  | 1            |
-- +----+-------+--------+--------------+
-- The Department table holds all departments of the company.

-- +----+----------+
-- | Id | Name     |
-- +----+----------+
-- | 1  | IT       |
-- | 2  | Sales    |
-- +----+----------+
-- Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows (order of rows does not matter).

-- +------------+----------+--------+
-- | Department | Employee | Salary |
-- +------------+----------+--------+
-- | IT         | Max      | 90000  |
-- | IT         | Randy    | 85000  |
-- | IT         | Joe      | 85000  |
-- | IT         | Will     | 70000  |
-- | Sales      | Henry    | 80000  |
-- | Sales      | Sam      | 60000  |
-- +------------+----------+--------+
-- Explanation:

-- In IT department, Max earns the highest salary, both Randy and Joe earn the second highest salary, 
-- and Will earns the third highest salary. 
-- There are only two employees in the Sales department, 
-- Henry earns the highest salary while Sam earns the second highest salary.

-- Solution
select a.department, a.employee, a.salary
from (
select d.name as department, e.name as employee, salary, 
    dense_rank() over(Partition by d.name order by salary desc) as rk
from Employee e join Department d
on e.departmentid = d.id) a
where a.rk<4

------------------------------------------------------

DROP TABLE IF EXISTS Employee;
CREATE TABLE IF NOT EXISTS Employee (
	id int,
	name varchar,
	salary int,
	dept_id int 
);



INSERT INTO Employee values(1,'Joe  ',85000,1);
INSERT INTO Employee values(2,'Henry',80000,2);
INSERT INTO Employee values(3,'Sam  ',60000,2);
INSERT INTO Employee values(4,'Max  ',90000,1);
INSERT INTO Employee values(5,'Janet',69000,1);
INSERT INTO Employee values(6,'Randy',85000,1);
INSERT INTO Employee values(7,'Will ',70000,1);


DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department (
	id int,
	name varchar
);


INSERT INTO Department values(1,'IT   ');
INSERT INTO Department values(2,'Sales');

select 
	dept_name,
	name,
	salary
from 
	(select 
		t2.name as dept_name,
		t1.name,
		salary,
		dense_rank() over(partition by dept_id order by salary desc) as rank 
	from Employee t1 join Department t2 on t1.dept_id = t2.id 
	) t 
where rank <= 3
;
