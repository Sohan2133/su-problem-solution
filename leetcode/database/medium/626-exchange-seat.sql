-- Question 56
-- Mary is a teacher in a middle school and she has a table seat storing students' names and their corresponding seat ids.

-- The column id is continuous increment.
 

-- Mary wants to change seats for the adjacent students.
 

-- Can you write a SQL query to output the result for Mary?
 

-- +---------+---------+
-- |    id   | student |
-- +---------+---------+
-- |    1    | Abbot   |
-- |    2    | Doris   |
-- |    3    | Emerson |
-- |    4    | Green   |
-- |    5    | Jeames  |
-- +---------+---------+
-- For the sample input, the output is:
 

-- +---------+---------+
-- |    id   | student |
-- +---------+---------+
-- |    1    | Doris   |
-- |    2    | Abbot   |
-- |    3    | Green   |
-- |    4    | Emerson |
-- |    5    | Jeames  |
-- +---------+---------+

-- Solution
select row_number() over (order by (if(id%2=1,id+1,id-1))) as id, student
from seat
------------------------------------------------

Table: Seat

+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |

DROP TABLE IF EXISTS Seat;
CREATE TABLE IF NOT EXISTS Seat (
	id int,
	student varchar
);


INSERT INTO Seat values(1,'Abbot  ');
INSERT INTO Seat values(2,'Doris  ');
INSERT INTO Seat values(3,'Emerson');
INSERT INTO Seat values(4,'Green  ');
INSERT INTO Seat values(5,'Jeames ');


select 
	case when id%2 = 0 then id - 1
		when id%2 = 1 and id+1 <= max_id then id+1
		else id end as id,
	student
from seat t1,(select max(id) as max_id from seat) t2 
order by 1 asc  
;