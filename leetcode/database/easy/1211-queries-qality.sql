Table: Queries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+

DROP TABLE IF EXISTS Queries;
CREATE TABLE IF NOT EXISTS Queries (
	query_name varchar,
	result varchar,
	position int,
	rating int 
);



INSERT INTO Queries VALUES('Dog','Golden Retriever',1  ,5);
INSERT INTO Queries VALUES('Dog','German Shepherd' ,2  ,5);
INSERT INTO Queries VALUES('Dog','Mule',200,1);
INSERT INTO Queries VALUES('Cat','Shirazi',5  ,2);
INSERT INTO Queries VALUES('Cat','Siamese',3  ,3);
INSERT INTO Queries VALUES('Cat','Sphynx',7  ,4);




select 
	query_name,
	round(avg(rating*1.0/position),2) as quality,
	round(sum(case when rating < 3 then 1 else 0 end)*100.0/count(*),2) as poor_query_percentage
from Queries
group by 1
;