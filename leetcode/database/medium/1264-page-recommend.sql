-- Question 84
-- Table: Friendship

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user1_id      | int     |
-- | user2_id      | int     |
-- +---------------+---------+
-- (user1_id, user2_id) is the primary key for this table.
-- Each row of this table indicates that there is a friendship relation between user1_id and user2_id.
 

-- Table: Likes

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | user_id     | int     |
-- | page_id     | int     |
-- +-------------+---------+
-- (user_id, page_id) is the primary key for this table.
-- Each row of this table indicates that user_id likes page_id.
 

-- Write an SQL query to recommend pages to the user with user_id = 1 using the pages that your friends liked. It should not recommend pages you already liked.

-- Return result table in any order without duplicates.

-- The query result format is in the following example:

-- Friendship table:
-- +----------+----------+
-- | user1_id | user2_id |
-- +----------+----------+
-- | 1        | 2        |
-- | 1        | 3        |
-- | 1        | 4        |
-- | 2        | 3        |
-- | 2        | 4        |
-- | 2        | 5        |
-- | 6        | 1        |
-- +----------+----------+
 
-- Likes table:
-- +---------+---------+
-- | user_id | page_id |
-- +---------+---------+
-- | 1       | 88      |
-- | 2       | 23      |
-- | 3       | 24      |
-- | 4       | 56      |
-- | 5       | 11      |
-- | 6       | 33      |
-- | 2       | 77      |
-- | 3       | 77      |
-- | 6       | 88      |
-- +---------+---------+

-- Result table:
-- +------------------+
-- | recommended_page |
-- +------------------+
-- | 23               |
-- | 24               |
-- | 56               |
-- | 33               |
-- | 77               |
-- +------------------+
-- User one is friend with users 2, 3, 4 and 6.
-- Suggested pages are 23 from user 2, 24 from user 3, 56 from user 3 and 33 from user 6.
-- Page 77 is suggested from both user 2 and user 3.
-- Page 88 is not suggested because user 1 already likes it.

-- Solution
select distinct page_id as recommended_page
from likes
where user_id = 
any(select user2_id as id
from friendship
where user1_id = 1 or user2_id = 1 and user2_id !=1
union all
select user1_id
from friendship
where user2_id = 1) 
and page_id != all(select page_id from likes where user_id = 1)
--------------------------------------------------------



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