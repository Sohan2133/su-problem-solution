Table : NPV
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| year          | int     |
| npv           | int     |
+---------------+---------+

DROP TABLE IF EXISTS NPV;
CREATE TABLE IF NOT EXISTS NPV (
	id int,
	year int,
	npv int
);



INSERT INTO NPV values(1 ,2018, 100);
INSERT INTO NPV values(7 ,2020, 30 );
INSERT INTO NPV values(13,2019, 40 );
INSERT INTO NPV values(1 ,2019, 113);
INSERT INTO NPV values(2 ,2008, 121);
INSERT INTO NPV values(3 ,2009, 12 );
INSERT INTO NPV values(11,2020, 99 );
INSERT INTO NPV values(7 ,2019, 0  );

Table: Queries
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| year          | int     |
+---------------+---------+

DROP TABLE IF EXISTS Queries;
CREATE TABLE IF NOT EXISTS Queries (
	id int,
	year int
);


INSERT INTO Queries values(1 , 2019);
INSERT INTO Queries values(2 , 2008);
INSERT INTO Queries values(3 , 2009);
INSERT INTO Queries values(7 , 2018);
INSERT INTO Queries values(7 , 2019);
INSERT INTO Queries values(7 , 2020);
INSERT INTO Queries values(13, 2019);


select 
	t1.id as id,
	t1.year as year,
	case when npv is null then 0 else npv end as npv 
from Queries t1 left join NPV t2
using(id,year)
;









