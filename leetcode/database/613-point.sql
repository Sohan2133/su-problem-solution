DROP TABLE IF EXISTS Point;
CREATE TABLE IF NOT EXISTS Point (
	x int
);

INSERT INTO Point(x) values(-1);
INSERT INTO Point(x) values(0);
INSERT INTO Point(x) values(2);


select 
	min(abs(t1.x - t2.x)) as dis
from Point t1, Point t2 
where t1.x != t2.x
