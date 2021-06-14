Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
| mail          | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users (
	user_id int,
	name varchar,
	email varchar
);



INSERT INTO Users values(1,'Winston  ','winston@leetcode.com'    );
INSERT INTO Users values(2,'Jonathan ','jonathanisgreat'         );
INSERT INTO Users values(3,'Annabelle','bella-@leetcode.com'     );
INSERT INTO Users values(4,'Sally    ','sally.come@leetcode.com' );
INSERT INTO Users values(5,'Marwan   ','quarz#2020@leetcode.com' );
INSERT INTO Users values(6,'David    ','david69@gmail.com'       );
INSERT INTO Users values(7,'Shapiro  ','.shapo@leetcode.com');


select 
	*
from Users
where email ~ '^[A-Za-z][A-Za-z0-9\_\.\-]*@leetcode.com$'
;