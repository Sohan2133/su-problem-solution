
Table: Follow 
+-------------+------------+
| followee    | follower   |
+-------------+------------+
|     A       |     B      |
|     B       |     C      |
|     B       |     D      |
|     D       |     E      |
+-------------+------------+

DROP TABLE IF EXISTS Follow;
CREATE TABLE IF NOT EXISTS Follow (
	followee varchar,
	follower varchar
);


INSERT INTO Follow values('A',     'B');
INSERT INTO Follow values('B',     'C');
INSERT INTO Follow values('B',     'D');
INSERT INTO Follow values('D',     'E');

select 
	t1.follower,
	count(*)
from Follow t1 join Follow t2 
on t1.follower = t2.followee
group by 1
order by 2 desc 

	