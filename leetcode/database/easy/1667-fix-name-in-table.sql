Table: users
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+

DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users (
	user_id int,
	name varchar
);



INSERT INTO Users values(1,'aLice' );
INSERT INTO Users values(2,'bOB  ');

First Solution:
------------------------
select 
	user_id,
	initcap(lower(name)) as name
from Users
;

Second Solution:
------------------
select 
	user_id,
	concat(upper(left(name,1)) , lower(substring(name,2)))
from Users 

