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