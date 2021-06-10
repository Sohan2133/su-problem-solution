Table: Submissions

+---------------+----------+
| Column Name   | Type     |
+---------------+----------+
| sub_id        | int      |
| parent_id     | int      |
+---------------+----------+

DROP TABLE IF EXISTS Submissions;
CREATE TABLE IF NOT EXISTS Submissions (
	sub_id int,
	parent_id int 
);



INSERT INTO Submissions VALUES(1 ,Null);
INSERT INTO Submissions VALUES(2 ,Null);
INSERT INTO Submissions VALUES(1 ,Null);
INSERT INTO Submissions VALUES(12,Null);
INSERT INTO Submissions VALUES(3 ,1   );
INSERT INTO Submissions VALUES(5 ,2   );
INSERT INTO Submissions VALUES(3 ,1   );
INSERT INTO Submissions VALUES(4 ,1   );
INSERT INTO Submissions VALUES(9 ,1   );
INSERT INTO Submissions VALUES(10,2   );
INSERT INTO Submissions VALUES(6 ,7   );

First solution:
-------------------

select 
	t1.post_id,
	count(distinct t2.comment_id) as comments
from 
	(select 
		sub_id as post_id 
	from Submissions
	where parent_id is null 
	) t1 
	left join
	(select 
		sub_id as comment_id,
		parent_id as post_id
	from Submissions
	where parent_id is not null 
	)t2
on t1.post_id = t2.post_id
group by 1

second solution:
-----------------------
select 
	t1.sub_id as post_id,
	count(distinct t2.sub_id) as comments
from Submissions t1 left join Submissions t2 on 
t1.sub_id = t2.parent_id
where t1.parent_id is null 
group by 1
