Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+

DROP TABLE IF EXISTS Logs;
CREATE TABLE IF NOT EXISTS Logs (
	id int,
	num varchar
);

INSERT INTO Logs values(1, 1);
INSERT INTO Logs values(2, 1);
INSERT INTO Logs values(3, 1);
INSERT INTO Logs values(4, 2);
INSERT INTO Logs values(5, 1);
INSERT INTO Logs values(6, 2);
INSERT INTO Logs values(7, 2);
INSERT INTO Logs values(8, 2);


select 
	distinct t1.num
from Logs t1,Logs t2,Logs t3
where t1.num = t2.num and t2.num = t3.num
and t1.id + 1 = t2.id and t2.id + 1 = t3.id
;
