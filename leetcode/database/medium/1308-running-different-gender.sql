Table: Scores
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| player_name   | varchar |
| gender        | varchar |
| day           | date    |
| score_points  | int     |
+---------------+---------+

DROP TABLE IF EXISTS Scores;
CREATE TABLE IF NOT EXISTS Scores (
	player_name varchar,
	gender varchar,
	day date,
	score_points int 
);

INSERT INTO Scores values('Aron    ','F' ,'2020-01-01',17);
INSERT INTO Scores values('Alice   ','F' ,'2020-01-07',23);
INSERT INTO Scores values('Bajrang ','M' ,'2020-01-07',7 );
INSERT INTO Scores values('Khali   ','M' ,'2019-12-25',11);
INSERT INTO Scores values('Slaman  ','M' ,'2019-12-30',13);
INSERT INTO Scores values('Joe     ','M' ,'2019-12-31',3 );
INSERT INTO Scores values('Jose    ','M' ,'2019-12-18',2 );
INSERT INTO Scores values('Priya   ','F' ,'2019-12-31',23);
INSERT INTO Scores values('Priyanka','F' ,'2019-12-30',17);


First Solution:
-----------------------
select 
	gender,
	day,
	sum(score_points) over(partition by gender order by day asc)
from Scores
;

Second Solution:
--------------------
select 
	gender,
	day,
	(select sum(score_points) from Scores where day <= t1.day and gender = 'F') as total
from Scores t1
where gender = 'F'
union 
select 
	gender,
	day,
	(select sum(score_points) from Scores where day <= t1.day and gender = 'M') as total 
from Scores t1
where gender = 'M'
order by gender,day asc 
;