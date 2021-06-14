Table: SchoolA

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+

DROP TABLE IF EXISTS SchoolA;
CREATE TABLE IF NOT EXISTS SchoolA (
	student_id int,
	student_name varchar
);


INSERT INTO SchoolA values(1,'Alice');
INSERT INTO SchoolA values(2,'Bob  ');

Table: SchoolB

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+

DROP TABLE IF EXISTS SchoolB;
CREATE TABLE IF NOT EXISTS SchoolB (
	student_id int,
	student_name varchar
);


INSERT INTO SchoolB values(3,'Tom');


Table: SchoolC
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+

DROP TABLE IF EXISTS SchoolC;
CREATE TABLE IF NOT EXISTS SchoolC (
	student_id int,
	student_name varchar
);


INSERT INTO SchoolC values(3 ,'Tom  ');
INSERT INTO SchoolC values(2 ,'Jerry');
INSERT INTO SchoolC values(10,'Alice');
INSERT INTO SchoolC values(1,'Alice');

select 
	t1.student_name as memberA,
	t2.student_name as memberB,
	t3.student_name as memberC
from SchoolA t1, SchoolB t2, SchoolC t3 
where t1.student_id not in (t2.student_id, t3.student_id) 
and t2.student_id not in (t1.student_id, t3.student_id) 
and t3.student_id not in (t2.student_id, t1.student_id)
and t1.student_name not in (t2.student_name, t3.student_name) 
and t2.student_name not in (t1.student_name, t3.student_name) 
and t3.student_name not in (t2.student_name, t1.student_name)











