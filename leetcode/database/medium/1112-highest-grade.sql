
Table: Enrollments

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| course_id     | int     |
| grade         | int     |
+---------------+---------+

DROP TABLE IF EXISTS Enrollments;
CREATE TABLE IF NOT EXISTS Enrollments (
	student_id int,
	course_id int,
	grade int 
);

INSERT INTO Enrollments values(2, 2, 95);
INSERT INTO Enrollments values(2, 3, 95);
INSERT INTO Enrollments values(1, 1, 90);
INSERT INTO Enrollments values(1, 2, 99);
INSERT INTO Enrollments values(3, 1, 80);
INSERT INTO Enrollments values(3, 2, 75);
INSERT INTO Enrollments values(3, 3, 82);

First Solution:
----------------------

select 
	student_id,
	course_id,
	grade
from 
	(select 
		*,
		rank() over(partition by student_id order by grade desc, course_id asc) rank 
	from Enrollments
	)t 
where rank = 1 
order by student_id asc;

Second Solution:
-------------------------

select 
	student_id,
	min(course_id),
	max(grade)
from Enrollments
where (student_id,grade) in (
				select 
					student_id, 
					max(grade) as grade 
				from Enrollments
				group by 1
				) 
group by student_id
;




