Table : Actions 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| post_id       | int     |
| action_date   | date    |
| action        | enum    |
| extra         | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Actions;
CREATE TABLE IF NOT EXISTS Actions (
	user_id int,
	post_id int,
	action_date date,
	action varchar,
	extra varchar
);


INSERT INTO Actions values(1, 1, '2019-07-01', 'view  ', null  );
INSERT INTO Actions values(1, 1, '2019-07-01', 'like  ', null  );
INSERT INTO Actions values(1, 1, '2019-07-01', 'share ', null  );
INSERT INTO Actions values(2, 2, '2019-07-04', 'view  ', null  );
INSERT INTO Actions values(2, 2, '2019-07-04', 'report', 'spam'  );
INSERT INTO Actions values(3, 4, '2019-07-04', 'view  ', null  );
INSERT INTO Actions values(3, 4, '2019-07-04', 'report', 'spam'  );
INSERT INTO Actions values(4, 3, '2019-07-02', 'view  ', null  );
INSERT INTO Actions values(4, 3, '2019-07-02', 'report', 'spam'  );
INSERT INTO Actions values(5, 2, '2019-07-03', 'view  ', null  );
INSERT INTO Actions values(5, 2, '2019-07-03', 'report', 'racism');
INSERT INTO Actions values(5, 5, '2019-07-03', 'view  ', null  );
INSERT INTO Actions values(5, 5, '2019-07-03', 'report', 'racism');

Table: Removals 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| post_id       | int     |
| remove_date   | date    | 
+---------------+---------+

DROP TABLE IF EXISTS Removals;
CREATE TABLE IF NOT EXISTS Removals (
	post_id int,
	remove_date date 
);


INSERT INTO Removals values(2, '2019-07-20');
INSERT INTO Removals values(3, '2019-07-18');

select 
	round(avg(per),2)
from 
	(
	select 
		action_date,
		sum(case when t2.post_id is not null then 1 else 0 end)*100.0/count(*) as per
	from Actions t1 left join Removals t2 on t1.post_id = t2.post_id
	where action = 'report' 
	and extra = 'spam'
	group by action_date 
	) t 
;










