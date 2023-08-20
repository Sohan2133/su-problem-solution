--Person table:
+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
--ques:Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
CREATE TABLE IF NOT EXISTS Person(
    Id int PRIMARY KEY, 
    Email VARCHAR(100)
);

INSERT INTO Person(Id, Email) VALUES(1,'a@b.com');
INSERT INTO Person(Id, Email) VALUES(2,'c@d.com');
INSERT INTO Person(Id, Email) VALUES(3,'a@b.com');

First Solution:
----------------
select 
	Email
from Person
group by Email
having count(*) > 1 ;

Second Solution:
-----------------
select 
	t1.Email as Email
from
	(select 
		Email,
		count(*) as c 
	from Person
	group by Email
	) t1 
where t1.c > 1
	