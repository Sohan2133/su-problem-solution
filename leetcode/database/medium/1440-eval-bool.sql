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









