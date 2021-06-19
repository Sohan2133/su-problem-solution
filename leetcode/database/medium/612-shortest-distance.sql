Table : point_2d
| x  | y  |
|----|----|
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |

DROP TABLE IF EXISTS point_2d;
CREATE TABLE IF NOT EXISTS point_2d (
	x int,
	y int
);



INSERT INTO point_2d values( -1 , -1);
INSERT INTO point_2d values( 0  , 0 );
INSERT INTO point_2d values( -1 , -2);

select
	round(sqrt(pow((t1.x - t2.x),2) + pow((t1.y - t2.y),2))::numeric, 2)
from point_2d t1 join point_2d t2 
on t1.x != t2.x or t1.y != t2.y
order by 1 asc limit 1 