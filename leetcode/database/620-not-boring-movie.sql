+---------+-----------+--------------+-----------+
|   id    | movie     |  description |  rating   |
+---------+-----------+--------------+-----------+
|   1     | War       |   great 3D   |   8.9     |
|   2     | Science   |   fiction    |   8.5     |
|   3     | irish     |   boring     |   6.2     |
|   4     | Ice song  |   Fantacy    |   8.6     |
|   5     | House card|   Interesting|   9.1     |
+---------+-----------+--------------+-----------+

DROP TABLE IF EXISTS Cinema;
CREATE TABLE IF NOT EXISTS Cinema (
	id int, 
	movie varchar(100), 
	description varchar(100), 
	rating float
);


INSERT INTO Cinema(id, movie, description, rating) values(1,'War','great 3D',8.9);
INSERT INTO Cinema(id, movie, description, rating) values(2,'Science','fiction',8.5);
INSERT INTO Cinema(id, movie, description, rating) values(3,'irish','boring',6.2);
INSERT INTO Cinema(id, movie, description, rating) values(4,'Ice song','Fantacy',8.6);
INSERT INTO Cinema(id, movie, description, rating) values(5,'House card','Interesting',9.1);


select 
	*
from Cinema
where id % 2 = 1 
and description not like '%boring%'
;