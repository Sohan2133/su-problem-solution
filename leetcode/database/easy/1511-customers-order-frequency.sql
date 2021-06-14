Table: Customers

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| country       | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Customers;
CREATE TABLE IF NOT EXISTS Customers (
	customer_id int,
	name varchar,
	country varchar
);


INSERT INTO Customers values(1,'Winston ','USA  ');
INSERT INTO Customers values(2,'Jonathan','Peru ');
INSERT INTO Customers values(3,'Moustafa','Egypt');

Table: Product 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| description   | varchar |
| price         | int     |
+---------------+---------+

DROP TABLE IF EXISTS Product;
CREATE TABLE IF NOT EXISTS Product (
	product_id int,
	description varchar,
	price int
);


INSERT INTO Product values(10,'LC Phone   ',300);
INSERT INTO Product values(20,'LC T-Shirt ',10 );
INSERT INTO Product values(30,'LC Book    ',45 );
INSERT INTO Product values(40,'LC Keychain',2);

TABLE : orders 

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| customer_id   | int     |
| product_id    | int     |
| order_date    | date    |
| quantity      | int     |
+---------------+---------+

DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders (
	order_id int,
	customer_id int, 
	product_id int,
	order_date date, 
	quantity int 
);


INSERT INTO Orders values(1,1,10,'2020-06-10',1 );       
INSERT INTO Orders values(2,1,20,'2020-07-01',1 );       
INSERT INTO Orders values(3,1,30,'2020-07-08',2 );       
INSERT INTO Orders values(4,2,10,'2020-06-15',2 );       
INSERT INTO Orders values(5,2,40,'2020-07-01',10);       
INSERT INTO Orders values(6,3,20,'2020-06-24',2 );       
INSERT INTO Orders values(7,3,30,'2020-06-25',2 );       
INSERT INTO Orders values(9,3,30,'2020-05-08',3);

select 
	customer_id,
	name
from 
(select 	
 t1.customer_id,
 t3.name,
 sum(case when extract(month from order_date) = 6 then quantity*price else 0 end) as jun_order,
 sum(case when extract(month from order_date) = 7 then quantity*price else 0 end) as july_order
from orders t1 join Product t2 on t1.product_id = t2.product_id
join Customers t3 on t1.customer_id = t3.customer_id
group by 1,2
)t
where jun_order >= 100 
and july_order >=100
;





