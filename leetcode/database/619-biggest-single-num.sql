
+---+
|num|
+---+
| 8 |
| 8 |
| 3 |
| 3 |
| 1 |
| 4 |
| 5 |
| 6 |
+---+

DROP TABLE IF EXISTS Number;
CREATE TABLE IF NOT EXISTS Number (
	num int  
);



INSERT INTO Number(num) values(8);
INSERT INTO Number(num) values(8);
INSERT INTO Number(num) values(3);
INSERT INTO Number(num) values(3);
INSERT INTO Number(num) values(1);
INSERT INTO Number(num) values(4);
INSERT INTO Number(num) values(5);
INSERT INTO Number(num) values(6);

select 
	max(num)
from 
(	
	select 
		num
	from Number
	group by num 
	having count(*) = 1
)t
;