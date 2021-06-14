Table: Users 
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+

DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users (
	user_id int,
	name varchar
);

INSERT INTO Users values(6,'Alice');
INSERT INTO Users values(2,'Bob  ');
INSERT INTO Users values(7,'Alex ');

Table: Register

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| contest_id  | int     |
| user_id     | int     |
+-------------+---------+

DROP TABLE IF EXISTS Register;
CREATE TABLE IF NOT EXISTS Register (
	contest_id int,
	user_id int
);


INSERT INTO Register values(215,6);
INSERT INTO Register values(209,2);
INSERT INTO Register values(208,2);
INSERT INTO Register values(210,6);
INSERT INTO Register values(208,6);
INSERT INTO Register values(209,7);
INSERT INTO Register values(209,6);
INSERT INTO Register values(215,7);
INSERT INTO Register values(208,7);
INSERT INTO Register values(210,2);
INSERT INTO Register values(207,2);
INSERT INTO Register values(210,7);

First Solution:
-------------------

select 
	contest_id,
	round(count(distinct user_id)*100.0/(select count(*) from Users), 2)
from Register
group by 1
order by 2 desc

Second Solution:
-----------------

select 
	contest_id,
	round(count(distinct t1.user_id) * 100.0 /count(distinct t2.user_id), 2)
from Register t1, Users t2
group by contest_id
;





