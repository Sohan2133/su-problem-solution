| x  | y  | z  |
|----|----|----|
| 13 | 15 | 30 |
| 10 | 20 | 15 |

DROP TABLE IF EXISTS trinagle;
CREATE TABLE IF NOT EXISTS trinagle (
	x int,
	y int,
	z int
);

INSERT INTO trinagle(x,y,z) VALUES(13,15,30);
INSERT INTO trinagle(x,y,z) VALUES(10,20,15);	

select 
	*,
	case when x+y>z and x+z>y and y+z>x then 'yes' else 'no' end
from trinagle