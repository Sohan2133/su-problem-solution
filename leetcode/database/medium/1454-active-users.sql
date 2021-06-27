Table: Accounts
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
DROP TABLE IF EXISTS Accounts;
CREATE TABLE IF NOT EXISTS Accounts (
	id int,
	name varchar
);


INSERT INTO Accounts values(1,'Winston ');
INSERT INTO Accounts values(7,'Jonathan');

Table: Logins
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| login_date    | date    |
+---------------+---------+
DROP TABLE IF EXISTS Logins;
CREATE TABLE IF NOT EXISTS Logins (
	id int,
	login_date date
);


INSERT INTO Logins values(7,'2020-05-30');
INSERT INTO Logins values(1,'2020-05-30');
INSERT INTO Logins values(7,'2020-05-31');
INSERT INTO Logins values(7,'2020-06-01');
INSERT INTO Logins values(7,'2020-06-02');
INSERT INTO Logins values(7,'2020-06-02');
INSERT INTO Logins values(7,'2020-06-03');
INSERT INTO Logins values(1,'2020-06-07');
INSERT INTO Logins values(7,'2020-06-10');

First Solution:
------------------------

select 
	distinct t1.id,
	(select name from Accounts where t1.id = id) as name 
from Logins t1 join Logins t2 on t1.id = t2.id and date(t1.login_date + interval '1' day) = t2.login_date
join Logins t3 on t1.id = t2.id and date(t2.login_date + interval '1' day) = t3.login_date
join Logins t4 on t1.id = t2.id and date(t3.login_date + interval '1' day) = t4.login_date
join Logins t5 on t1.id = t2.id and date(t4.login_date + interval '1' day) = t5.login_date
;

Second Solution (we will solve later):
-------------------------------

select 
	*,
	'1970-01-01'::date + interval rank day 
from 
	(select 
		*,
		(dense_rank() over(partition by id order by login_date asc))::varchar as rank 
	from Logins) t 
;


