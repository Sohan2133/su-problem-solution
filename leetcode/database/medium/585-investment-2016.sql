Table : insurance
| Column Name | Type          |
|-------------|---------------|
| PID         | INTEGER(11)   |
| TIV_2015    | NUMERIC(15,2) |
| TIV_2016    | NUMERIC(15,2) |
| LAT         | NUMERIC(5,2)  |
| LON         | NUMERIC(5,2)  |

DROP TABLE IF EXISTS insurance;
CREATE TABLE IF NOT EXISTS insurance (
	PID int,
	TIV_2015 int,
	TIV_2016 int,
	LAT int,
	LON int 
);


INSERT INTO insurance values(1, 10, 5 , 10, 10);
INSERT INTO insurance values(2, 20, 20, 20, 20);
INSERT INTO insurance values(3, 10, 30, 20, 20);
INSERT INTO insurance values(4, 10, 40, 40, 40);


select 
	sum(TIV_2016)
from insurance 
where TIV_2015 in ( select TIV_2015 from insurance group by 1 having count(*) > 1)
and (lat,lon) in (select lat,lon from insurance group by 1,2 having count(*) = 1)
	 