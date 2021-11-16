-- Question 88
-- Table: Candidate

-- +-----+---------+
-- | id  | Name    |
-- +-----+---------+
-- | 1   | A       |
-- | 2   | B       |
-- | 3   | C       |
-- | 4   | D       |
-- | 5   | E       |
-- +-----+---------+  
-- Table: Vote

-- +-----+--------------+
-- | id  | CandidateId  |
-- +-----+--------------+
-- | 1   |     2        |
-- | 2   |     4        |
-- | 3   |     3        |
-- | 4   |     2        |
-- | 5   |     5        |
-- +-----+--------------+
-- id is the auto-increment primary key,
-- CandidateId is the id appeared in Candidate table.
-- Write a sql to find the name of the winning candidate, the above example will return the winner B.

-- +------+
-- | Name |
-- +------+
-- | B    |
-- +------+
-- Notes:

-- You may assume there is no tie, in other words there will be only one winning candidate

-- Solution
with t1 as (
select *, rank() over(order by b.votes desc) as rk
from candidate c
join 
(select candidateid, count(*) as votes
from vote
group by candidateid) b
on c.id = b.candidateid)

select t1.name
from t1
where t1.rk=1
----------------------------------------------

+-----+---------+
| id  | Name    |
+-----+---------+
| 1   | A       |
| 2   | B       |
| 3   | C       |
| 4   | D       |
| 5   | E       |
+-----+---------+  

DROP TABLE IF EXISTS Candidate;
CREATE TABLE IF NOT EXISTS Candidate (
	id int,
	name varchar
);

INSERT INTO Candidate values(1, 'A');
INSERT INTO Candidate values(2, 'B');
INSERT INTO Candidate values(3, 'C');
INSERT INTO Candidate values(4, 'D');
INSERT INTO Candidate values(5, 'E');
+-----+--------------+
| id  | CandidateId  |
+-----+--------------+
| 1   |     2        |
| 2   |     4        |
| 3   |     3        |
| 4   |     2        |
| 5   |     5        |
+-----+--------------+

DROP TABLE IF EXISTS Vote;
CREATE TABLE IF NOT EXISTS Vote (
	id int,
	CandidateId int
);

INSERT INTO Vote values(1,     2);
INSERT INTO Vote values(2,     4);
INSERT INTO Vote values(3,     3);
INSERT INTO Vote values(4,     2);
INSERT INTO Vote values(5,     5);

select 
	name
from 
(select 
		CandidateId,
		count(*) as num_vote 
	from Vote
	group by 1
	order by 2 desc limit 1
) t1 join Candidate t2 
on t1.CandidateId = t2.id