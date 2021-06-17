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