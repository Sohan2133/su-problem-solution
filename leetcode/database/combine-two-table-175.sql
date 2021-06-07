+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+

CREATE TABLE IF NOT EXISTS Person(
    PersonId int PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100)
);

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+

CREATE TABLE IF NOT EXISTS Address(
    AddressId int PRIMARY KEY,
    PersonId int,
    City VARCHAR(100),
    State VARCHAR(100)
);

INSERT INTO Person(PersonId, FirstName, LastName) VALUES (1,'shihab', 'haq');
INSERT INTO Person(PersonId, FirstName, LastName) VALUES (2,'hasan', 'islam');
INSERT INTO Person(PersonId, FirstName, LastName) VALUES (3,'rakib', 'uddin');
INSERT INTO Person(PersonId, FirstName, LastName) VALUES (4,'rahul', 'uddin');
INSERT INTO Person(PersonId, FirstName, LastName) VALUES (5,'sakib', 'uddin');


INSERT INTO Address(AddressId,PersonId,City,State) VALUES (1,1,'dhaka', 'bangladesh');
INSERT INTO Address(AddressId,PersonId,City,State) VALUES (2,2,'dhaka', 'bangladesh');
INSERT INTO Address(AddressId,PersonId,City,State) VALUES (3,3,'dhaka', 'bangladesh');
INSERT INTO Address(AddressId,PersonId,City,State) VALUES (4,4,'dhaka', 'bangladesh');
INSERT INTO Address(AddressId,PersonId,City,State) VALUES (5,5,'dhaka', 'bangladesh');


select 
	FirstName, 
	LastName, 
	City, 
	State
from Person t1 join Address t2 
on t1.PersonId = t2.PersonId;

