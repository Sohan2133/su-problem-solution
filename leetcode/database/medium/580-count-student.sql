Table: Student
| Column Name  | Type      |
|--------------|-----------|
| student_id   | Integer   |
| student_name | String    |
| gender       | Character |
| dept_id      | Integer   |


DROP TABLE IF EXISTS Student;
CREATE TABLE IF NOT EXISTS Student (
	student_id int,
	student_name varchar,
	gender varchar,
	dept_id int
);


INSERT INTO Student values(1, 'Jack', 'M', 1);
INSERT INTO Student values(2, 'Jane', 'F', 1);
INSERT INTO Student values(3, 'Mark', 'M', 2);

DROP TABLE IF EXISTS Department;
CREATE TABLE IF NOT EXISTS Department (
	dept_id int,
	dept_name varchar
);



INSERT INTO Department values(1, 'Engineering');
INSERT INTO Department values(2, 'Science    ');
INSERT INTO Department values(3, 'Law        ');


select 
	dept_name,
	case when t2.dept_id is null then 0 else num_student end as total_students
from Department t1 
left join 
	(select 
		dept_id,
		count(*) num_student
	from Student
	group by 1
	) t2
on t1.dept_id = t2.dept_id
;