| seat_id | free |
|---------|------|
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |

Question: query all the consecutive available seats order by the seat_id

DROP TABLE IF EXISTS Seat;
CREATE TABLE IF NOT EXISTS Seat (
	seat_id int,
	free int
);


INSERT INTO Seat(seat_id, free) VALUES(1 ,1 );
INSERT INTO Seat(seat_id, free) VALUES(2 ,0 );
INSERT INTO Seat(seat_id, free) VALUES(3 ,1 );
INSERT INTO Seat(seat_id, free) VALUES(4 ,1 );
INSERT INTO Seat(seat_id, free) VALUES(5 ,1 );

First Solution:
------------------------

select 
	distinct t1.seat_id
from Seat t1, Seat t2 
where ((t1.seat_id  = t2.seat_id + 1) or (t1.seat_id  = t2.seat_id - 1))
and t1.free = 1 
and t2.free = 1
;

Second Solution:
-----------------------

select 
	distinct t1.seat_id as seat_id
from Seat t1, Seat t2 
where (t1.seat_id  = t2.seat_id + 1)
and t1.free = 1 
and t2.free = 1
union 
select 
	distinct t2.seat_id as seat_id
from Seat t1, Seat t2 
where (t1.seat_id  = t2.seat_id + 1)
and t1.free = 1 
and t2.free = 1
;