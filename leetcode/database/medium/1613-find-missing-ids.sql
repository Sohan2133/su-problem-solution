Table: Customers
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Customers;
CREATE TABLE IF NOT EXISTS Customers (
	customer_id int,
	name varchar
);


INSERT INTO Customers values(1,'Alice  ');
INSERT INTO Customers values(4,'Bob    ');
INSERT INTO Customers values(5,'Charlie');