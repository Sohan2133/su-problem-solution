
+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+

CREATE TABLE IF NOT EXISTS Customer(
    Id int PRIMARY KEY,
    Name VARCHAR(100)
);

INSERT INTO Customer(Id, Name) VALUES(1, 'Joe');
INSERT INTO Customer(Id, Name) VALUES(2, 'Henry');
INSERT INTO Customer(Id, Name) VALUES(3, 'Sam');
INSERT INTO Customer(Id, Name) VALUES(4, 'Max');

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+

CREATE TABLE IF NOT EXISTS Orders(
    Id int PRIMARY KEY,
    CustomerId int
);

INSERT INTO Orders(Id, CustomerId) VALUES(1, 3);
INSERT INTO Orders(Id, CustomerId) VALUES(2, 1);

select
	t1.Name as Customers
from Customer t1 left join Orders t2 
on t1.id = t2.CustomerId
Where t2.id is null 
;