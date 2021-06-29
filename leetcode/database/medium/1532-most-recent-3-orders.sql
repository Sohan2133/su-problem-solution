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


INSERT INTO Customers values(1,'Winston  ');
INSERT INTO Customers values(2,'Jonathan ');
INSERT INTO Customers values(3,'Annabelle');
INSERT INTO Customers values(4,'Marwan   ');
INSERT INTO Customers values(5,'Khaled   ');

Table: Orders
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| order_date    | date    |
| customer_id   | int     |
| cost          | int     |
+---------------+---------+

DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders (
	order_id int,
	order_date date,
	customer_id int,
	cost int
);


INSERT INTO Orders values(1 ,'2020-07-31', 1, 30  );
INSERT INTO Orders values(2 ,'2020-07-30', 2, 40  );
INSERT INTO Orders values(3 ,'2020-07-31', 3, 70  );
INSERT INTO Orders values(4 ,'2020-07-29', 4, 100 );
INSERT INTO Orders values(5 ,'2020-06-10', 1, 1010);
INSERT INTO Orders values(6 ,'2020-08-01', 2, 102 );
INSERT INTO Orders values(7 ,'2020-08-01', 3, 111 );
INSERT INTO Orders values(8 ,'2020-08-03', 1, 99  );
INSERT INTO Orders values(9 ,'2020-08-07', 2, 32  );
INSERT INTO Orders values(10,'2020-07-15', 1, 2   );


select 
	name,
	customer_id,
	order_id,
	order_date
from 
	(select 
		name,
		t1.customer_id,
		order_id,
		order_date,
		row_number() over(partition by t1.customer_id order by order_date desc) rn 
	from Orders t1 join Customers t2 using(customer_id))t
where rn <= 3
order by name asc, order_date desc
;



















