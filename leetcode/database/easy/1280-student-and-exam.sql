Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+

DROP TABLE IF EXISTS student;
CREATE TABLE IF NOT EXISTS student (
	student_id int,
	student_name varchar
);

INSERT INTO student VALUES(1 ,'Alice');
INSERT INTO student VALUES(2 ,'Bob');
INSERT INTO student VALUES(13,'John');
INSERT INTO student VALUES(6 ,'Alex');

DROP TABLE IF EXISTS subject;
CREATE TABLE IF NOT EXISTS subject (
	subject_name varchar
);

INSERT INTO subject VALUES('Math');  
INSERT INTO subject VALUES('Physics');  
INSERT INTO subject VALUES('Programming');

DROP TABLE IF EXISTS examinations;
CREATE TABLE IF NOT EXISTS examinations (
	student_id int,
	subject_name varchar
);

INSERT INTO examinations VALUES(1 ,'Math'        );
INSERT INTO examinations VALUES(1 ,'Physics'     );
INSERT INTO examinations VALUES(1 ,'Programming' );
INSERT INTO examinations VALUES(2 ,'Programming' );
INSERT INTO examinations VALUES(1 ,'Physics'     );
INSERT INTO examinations VALUES(1 ,'Math'        );
INSERT INTO examinations VALUES(13,'Math'        );
INSERT INTO examinations VALUES(13,'Programming' );
INSERT INTO examinations VALUES(13,'Physics'     );
INSERT INTO examinations VALUES(2 ,'Math'        );
INSERT INTO examinations VALUES(1 ,'Math');

select 
	t1.student_id,
	t1.subject_name,
	case when time_exam is null then 0 else time_exam end time_exam
from 
	(select 
		*
	from student,subject) t1 
	left join 
	(select 
		student_id,
		subject_name,
		count(*)as time_exam
	from examinations
	group by 1,2
	) t2 
on t1.student_id = t2.student_id
and t1.subject_name = t2.subject_name
order by 1 
