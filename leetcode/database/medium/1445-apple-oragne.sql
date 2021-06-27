
Table: Sales
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| sale_date     | date    |
| fruit         | enum    | 
| sold_num      | int     | 
+---------------+---------+

DROP TABLE IF EXISTS Sales;
CREATE TABLE IF NOT EXISTS Sales (
	sale_date date,
	fruit varchar,
	sold_num int
);


INSERT INTO Sales values('2020-05-01','apples ', 10);
INSERT INTO Sales values('2020-05-01','oranges', 8 );
INSERT INTO Sales values('2020-05-02','apples ', 15);
INSERT INTO Sales values('2020-05-02','oranges', 15);
INSERT INTO Sales values('2020-05-03','apples ', 20);
INSERT INTO Sales values('2020-05-03','oranges', 0 );
INSERT INTO Sales values('2020-05-04','apples ', 15);
INSERT INTO Sales values('2020-05-04','oranges', 16);


select 
	sale_date,
	sum(case when fruit='apples ' then sold_num else -sold_num end) as diff 
from Sales
group by 1
order by 1 asc 
;