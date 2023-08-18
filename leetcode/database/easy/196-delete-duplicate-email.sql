+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Question: Write an SQL query to delete all the duplicate emails, 
keeping only one unique email with the smallest id.

CREATE TABLE IF NOT EXISTS Person(
    Id int PRIMARY KEY, 
    Email VARCHAR(100)
);

INSERT INTO Person(Id, Email) VALUES(1,'john@example.com');
INSERT INTO Person(Id, Email) VALUES(2,'bob@example.com');
INSERT INTO Person(Id, Email) VALUES(3,'john@example.com');


delete
from Person where id in 
	(select 
		t1.id as id 
	from Person t1 join Person t2
	on t1.Email = t2.Email
	where t1.id > t2.id
	)
;