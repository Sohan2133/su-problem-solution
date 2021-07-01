Table: Contest
+--------------+------+
| Column Name  | Type |
+--------------+------+
| contest_id   | int  |
| gold_medal   | int  |
| silver_medal | int  |
| bronze_medal | int  |
+--------------+------+
DROP TABLE IF EXISTS Contest;
CREATE TABLE IF NOT EXISTS Contest (
	contest_id int,
	gold_medal int,
	silver_medal int,
	bronze_medal int 
);


INSERT INTO Contest values(190, 1, 5, 2);
INSERT INTO Contest values(191, 2, 3, 5);
INSERT INTO Contest values(192, 5, 2, 3);
INSERT INTO Contest values(193, 1, 3, 5);
INSERT INTO Contest values(194, 4, 5, 2);
INSERT INTO Contest values(195, 4, 2, 1);
INSERT INTO Contest values(196, 1, 5, 2);

Table: Users 
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| mail        | varchar |
| name        | varchar |
+-------------+---------+

DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users (
	user_id int,
	mail varchar,
	name varchar
);


INSERT INTO Users values(1,'sarah@leetcode.com','Sarah');
INSERT INTO Users values(2,'bob@leetcode.com  ','Bob  ');
INSERT INTO Users values(3,'alice@leetcode.com','Alice');
INSERT INTO Users values(4,'hercy@leetcode.com','Hercy');
INSERT INTO Users values(5,'quarz@leetcode.com','Quarz');

select 
	name
from 
((select 
	id
from 
	(select 
		contest_id,
		id,
		row_number() over(partition by id order by contest_id asc) rn 
	from 
	(select contest_id,gold_medal as id from Contest
	union 
	select contest_id, silver_medal as id from Contest
	union 
	select contest_id, bronze_medal as id from Contest
	) t 
) t1 
group by id 
having count(contest_id - rn) >= 3)
union
(select gold_medal as id from Contest group by gold_medal having count(contest_id) >= 3)) t1
join Users t2 on t1.id = t2.user_id
;











