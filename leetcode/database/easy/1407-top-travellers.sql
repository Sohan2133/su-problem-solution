
Table: Users
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+


DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users (
	id int,
	name varchar
);

INSERT INTO Users values(1 ,'Alice   ');
INSERT INTO Users values(2 ,'Bob     ');
INSERT INTO Users values(3 ,'Alex    ');
INSERT INTO Users values(4 ,'Donald  ');
INSERT INTO Users values(7 ,'Lee     ');
INSERT INTO Users values(13,'Jonathan');
INSERT INTO Users values(19,'Elvis   ');

+------+-----------+
Table: Rides
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| user_id       | int     |
| distance      | int     |
+---------------+---------+

DROP TABLE IF EXISTS Rides;
CREATE TABLE IF NOT EXISTS Rides (
	id int,
	user_id int, 
	distance int
);

INSERT INTO Rides values(1,1 ,120);
INSERT INTO Rides values(2,2 ,317);
INSERT INTO Rides values(3,3 ,222);
INSERT INTO Rides values(4,7 ,100);
INSERT INTO Rides values(5,13,312);
INSERT INTO Rides values(6,19,50 );
INSERT INTO Rides values(7,7 ,120);
INSERT INTO Rides values(8,19,400);
INSERT INTO Rides values(9,7 ,230);

select 
	name,
	total_distance
from 
(select 
	user_id,
	sum(distance) as total_distance
from Rides group by 1) t1, users t2 
where t1.user_id = t2.id 
order by total_distance desc, name asc;


