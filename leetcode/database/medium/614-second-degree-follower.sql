-- Question 70
-- In facebook, there is a follow table with two columns: followee, follower.

-- Please write a sql query to get the amount of each follower’s follower if he/she has one.

-- For example:

-- +-------------+------------+
-- | followee    | follower   |
-- +-------------+------------+
-- |     A       |     B      |
-- |     B       |     C      |
-- |     B       |     D      |
-- |     D       |     E      |
-- +-------------+------------+
-- should output:
-- +-------------+------------+
-- | follower    | num        |
-- +-------------+------------+
-- |     B       |  2         |
-- |     D       |  1         |
-- +-------------+------------+
-- Explaination:
-- Both B and D exist in the follower list, when as a followee, B's follower is C and D, and D's follower is E. A does not exist in follower list.
 

-- Note:
-- Followee would not follow himself/herself in all cases.
-- Please display the result in follower's alphabet order.

-- Solution
select followee as follower, count(distinct(follower)) as num
from follow
where followee = any(select follower from follow)
group by followee
order by followee
--------------------------------------------

Table: Follow 
+-------------+------------+
| followee    | follower   |
+-------------+------------+
|     A       |     B      |
|     B       |     C      |
|     B       |     D      |
|     D       |     E      |
+-------------+------------+

DROP TABLE IF EXISTS Follow;
CREATE TABLE IF NOT EXISTS Follow (
	followee varchar,
	follower varchar
);


INSERT INTO Follow values('A',     'B');
INSERT INTO Follow values('B',     'C');
INSERT INTO Follow values('B',     'D');
INSERT INTO Follow values('D',     'E');

select 
	t1.follower,
	count(*)
from Follow t1 join Follow t2 
on t1.follower = t2.followee
group by 1
order by 2 desc 

	