Table: Friendship
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user1_id      | int     |
| user2_id      | int     |
+---------------+---------+

DROP TABLE IF EXISTS Friendship;
CREATE TABLE IF NOT EXISTS Friendship (
	user1_id int,
	user2_id int
);

INSERT INTO Friendship values(1, 2);
INSERT INTO Friendship values(1, 3);
INSERT INTO Friendship values(1, 4);
INSERT INTO Friendship values(2, 3);
INSERT INTO Friendship values(2, 4);
INSERT INTO Friendship values(2, 5);
INSERT INTO Friendship values(6, 1);

Table: Likes
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| page_id     | int     |
+-------------+---------+

DROP TABLE IF EXISTS Likes;
CREATE TABLE IF NOT EXISTS Likes (
	user_id int,
	page_id int
);


INSERT INTO Likes values(1, 88);
INSERT INTO Likes values(2, 23);
INSERT INTO Likes values(3, 24);
INSERT INTO Likes values(4, 56);
INSERT INTO Likes values(5, 11);
INSERT INTO Likes values(6, 33);
INSERT INTO Likes values(2, 77);
INSERT INTO Likes values(3, 77);
INSERT INTO Likes values(6, 88);

select 
	distinct page_id
from 
	(select user1_id as user_id from Friendship where user2_id = 1
	union 
	select user2_id as user_id from Friendship where user1_id = 1) t1 
	join Likes t2 on t1.user_id = t2.user_id
and page_id not in (select distinct page_id from Likes where user_id = 1)
;