-- Question 78
-- Table Variables:

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | name          | varchar |
-- | value         | int     |
-- +---------------+---------+
-- name is the primary key for this table.
-- This table contains the stored variables and their values.
 

-- Table Expressions:

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | left_operand  | varchar |
-- | operator      | enum    |
-- | right_operand | varchar |
-- +---------------+---------+
-- (left_operand, operator, right_operand) is the primary key for this table.
-- This table contains a boolean expression that should be evaluated.
-- operator is an enum that takes one of the values ('<', '>', '=')
-- The values of left_operand and right_operand are guaranteed to be in the Variables table.
 

-- Write an SQL query to evaluate the boolean expressions in Expressions table.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Variables table:
-- +------+-------+
-- | name | value |
-- +------+-------+
-- | x    | 66    |
-- | y    | 77    |
-- +------+-------+

-- Expressions table:
-- +--------------+----------+---------------+
-- | left_operand | operator | right_operand |
-- +--------------+----------+---------------+
-- | x            | >        | y             |
-- | x            | <        | y             |
-- | x            | =        | y             |
-- | y            | >        | x             |
-- | y            | <        | x             |
-- | x            | =        | x             |
-- +--------------+----------+---------------+

-- Result table:
-- +--------------+----------+---------------+-------+
-- | left_operand | operator | right_operand | value |
-- +--------------+----------+---------------+-------+
-- | x            | >        | y             | false |
-- | x            | <        | y             | true  |
-- | x            | =        | y             | false |
-- | y            | >        | x             | true  |
-- | y            | <        | x             | false |
-- | x            | =        | x             | true  |
-- +--------------+----------+---------------+-------+
-- As shown, you need find the value of each boolean exprssion in the table using the variables table.

-- Solution
with t1 as(
select e.left_operand, e.operator, e.right_operand, v.value as left_val, v_1.value as right_val
from expressions e
join variables v
on v.name = e.left_operand 
join variables v_1
on v_1.name = e.right_operand)

select t1.left_operand, t1.operator, t1.right_operand,
case when t1.operator = '<' then (select t1.left_val< t1.right_val)
when t1.operator = '>' then (select t1.left_val > t1.right_val)
when t1.operator = '=' then (select t1.left_val = t1.right_val)
else FALSE
END AS VALUE
from t1
-----------------------------------------------------------

Table: Variables

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| name          | varchar |
| value         | int     |
+---------------+---------+
DROP TABLE IF EXISTS Variables;
CREATE TABLE IF NOT EXISTS Variables (
	name varchar,
	value int
);


INSERT INTO Variables values('x',66);
INSERT INTO Variables values('y',77);

Table: Expressions
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| left_operand  | varchar |
| operator      | enum    |
| right_operand | varchar |
+---------------+---------+


DROP TABLE IF EXISTS Expressions;
CREATE TABLE IF NOT EXISTS Expressions (
	left_operand varchar,
	operator varchar,
	right_operand varchar
);


INSERT INTO Expressions values('x','>', 'y');
INSERT INTO Expressions values('x','<', 'y');
INSERT INTO Expressions values('x','=', 'y');
INSERT INTO Expressions values('y','>', 'x');
INSERT INTO Expressions values('y','<', 'x');
INSERT INTO Expressions values('x','=', 'x');

First Solution:
-----------------------

select 
	left_operand,
	operator,
	right_operand,
	case when value then 'true' else 'false' end as value 
from 
	(select
		*, 
		case when operator = '>' 
				then (select value from Variables where name = left_operand) > (select value from Variables where name = right_operand)
			when operator = '='
				then (select value from Variables where name = left_operand) = (select value from Variables where name = right_operand) 
			when operator = '<'
				then  (select value from Variables where name = left_operand) < (select value from Variables where name = right_operand) 
		end as value 
	from Expressions)t 
;

Second Solution:
-----------------------------

select 
	left_operand,
	operator,
	right_operand,
	case when operator = '>' and t2.value > t3.value then 'true' 
		when operator = '=' and t2.value = t3.value then 'true' 
		when operator = '<' and t2.value < t3.value then 'true'
		else 'false'
	end as value
from Expressions t1 left join Variables t2 on t1.left_operand = t2.name
left join Variables t3 on t1.right_operand = t3.name 
;

Third Solution(trival change):
-----------------------

select 
	left_operand,
	operator,
	right_operand,
	case when operator = '>' then case when t2.value > t3.value then 'true' else 'false' end
		when operator = '=' then case when  t2.value = t3.value then 'true' else 'false' end
		else case when t2.value < t3.value then 'true' else 'false' end
	end as value
from Expressions t1 left join Variables t2 on t1.left_operand = t2.name
left join Variables t3 on t1.right_operand = t3.name 
;









