Table: Person 
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| id             | int     |
| name           | varchar |
| phone_number   | varchar |
+----------------+---------+
DROP TABLE IF EXISTS Person;
CREATE TABLE IF NOT EXISTS Person (
	id int,
	name varchar,
	phone_number varchar
);


INSERT INTO Person values(3 ,'Jonathan','051-1234567');
INSERT INTO Person values(12,'Elvis   ','051-7654321');
INSERT INTO Person values(1 ,'Moncef  ','212-1234567');
INSERT INTO Person values(2 ,'Maroua  ','212-6523651');
INSERT INTO Person values(7 ,'Meir    ','972-1234567');
INSERT INTO Person values(9 ,'Rachel  ','972-0011100');

Table: Country
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| name           | varchar |
| country_code   | varchar |
+----------------+---------+
DROP TABLE IF EXISTS Country;
CREATE TABLE IF NOT EXISTS Country (
	name varchar,
	country_code varchar
);


INSERT INTO Country values('Peru    ','051');
INSERT INTO Country values('Israel  ','972');
INSERT INTO Country values('Morocco ','212');
INSERT INTO Country values('Germany ','049');
INSERT INTO Country values('Ethiopia','251');


Table: Calls
+-------------+------+
| Column Name | Type |
+-------------+------+
| caller_id   | int  |
| callee_id   | int  |
| duration    | int  |
+-------------+------+
DROP TABLE IF EXISTS Calls;
CREATE TABLE IF NOT EXISTS Calls (
	caller_id int,
	callee_id int,
	duration int
);

INSERT INTO Calls values(1 , 9 , 33 );
INSERT INTO Calls values(2 , 9 , 4  );
INSERT INTO Calls values(1 , 2 , 59 );
INSERT INTO Calls values(3 , 12, 102);
INSERT INTO Calls values(3 , 12, 330);
INSERT INTO Calls values(12, 3 , 5  );
INSERT INTO Calls values(7 , 9 , 13 );
INSERT INTO Calls values(7 , 1 , 3  );
INSERT INTO Calls values(9 , 7 , 1  );
INSERT INTO Calls values(1 , 7 , 7  );


select 
	t3.name 
from (select caller_id as id, duration from Calls
		union
	  select callee_id as id, duration from Calls
	  ) t1 join Person t2 on t1.id = t2.id
		join Country t3 on substring(t2.phone_number, 1, 3) = t3.country_code
group by 1
having avg(duration) > (select avg(duration) from Calls)
;









