DROP TABLE IF EXISTS Point;
CREATE TABLE IF NOT EXISTS Point (
	x int
);

INSERT INTO Point(x) values(-1);
INSERT INTO Point(x) values(0);
INSERT INTO Point(x) values(2);

Question: Find min distance between two points. 

select 
	min(abs(t1.x - t2.x)) as dis
from Point t1, Point t2 
where t1.x != t2.x

---Sohan's solution---
select
	min(abs(p1.x - p2.x)) as distance
from point p1 join point p2 
on p1.x != p2.2;
