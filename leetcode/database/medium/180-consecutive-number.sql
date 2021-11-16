-- Question 52
-- Write a SQL query to find all numbers that appear at least three times consecutively.

-- +----+-----+
-- | Id | Num |
-- +----+-----+
-- | 1  |  1  |
-- | 2  |  1  |
-- | 3  |  1  |
-- | 4  |  2  |
-- | 5  |  1  |
-- | 6  |  2  |
-- | 7  |  2  |
-- +----+-----+
-- For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+

-- Solution
select distinct a.num as ConsecutiveNums
from(
select *,
lag(num) over() as prev,
lead(num) over() as next
from logs) a
where a.num = a.prev and a.num=a.next
------------------------------------------------------

Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+

DROP TABLE IF EXISTS Logs;
CREATE TABLE IF NOT EXISTS Logs (
	id int,
	num varchar
);

INSERT INTO Logs values(1, 1);
INSERT INTO Logs values(2, 1);
INSERT INTO Logs values(3, 1);
INSERT INTO Logs values(4, 2);
INSERT INTO Logs values(5, 1);
INSERT INTO Logs values(6, 2);
INSERT INTO Logs values(7, 2);
INSERT INTO Logs values(8, 2);


select 
	distinct t1.num
from Logs t1,Logs t2,Logs t3
where t1.num = t2.num and t2.num = t3.num
and t1.id + 1 = t2.id and t2.id + 1 = t3.id
;
