Table: Customers
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| customer_name | varchar |
| email         | varchar |
+---------------+---------+
DROP TABLE IF EXISTS Customers;
CREATE TABLE IF NOT EXISTS Customers (
	customer_id int,
	customer_name varchar,
	email varchar
);


INSERT INTO Customers values(1 ,'Alice','alice@leetcode.com');
INSERT INTO Customers values(2 ,'Bob  ','bob@leetcode.com  ');
INSERT INTO Customers values(13,'John ','john@leetcode.com ');
INSERT INTO Customers values(6 ,'Alex ','alex@leetcode.com ');

Table: Contacts
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | id      |
| contact_name  | varchar |
| contact_email | varchar |
+---------------+---------+
DROP TABLE IF EXISTS Contacts;
CREATE TABLE IF NOT EXISTS Contacts (
	user_id int,
	contact_name varchar,
	contact_email varchar
);

INSERT INTO Contacts values(1,'Bob  ','bob@leetcode.com  ');
INSERT INTO Contacts values(1,'John ','john@leetcode.com ');
INSERT INTO Contacts values(1,'Jal  ','jal@leetcode.com  ');
INSERT INTO Contacts values(2,'Omar ','omar@leetcode.com ');
INSERT INTO Contacts values(2,'Meir ','meir@leetcode.com ');
INSERT INTO Contacts values(6,'Alice','alice@leetcode.com');

Table: Invoices
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| invoice_id   | int     |
| price        | int     |
| user_id      | int     |
+--------------+---------+
DROP TABLE IF EXISTS Invoices;
CREATE TABLE IF NOT EXISTS Invoices (
	invoice_id int,
	price int,
	user_id int 
);

INSERT INTO Invoices values(77 , 100, 1 );
INSERT INTO Invoices values( 88, 200, 1 );
INSERT INTO Invoices values( 99, 300, 2 );
INSERT INTO Invoices values( 66, 400, 2 );
INSERT INTO Invoices values( 55, 500, 13);
INSERT INTO Invoices values( 44, 60 , 6 );


select 
	invoice_id,
	price,
	(select customer_name from Customers where customer_id = t1.user_id),
	sum(case when t2.user_id is not null then 1 else 0 end) as contacts_cnt,
	sum(case when t3.email is not null then 1 else 0 end) as trusted_cnt
from Invoices t1 left join Contacts t2 on t1.user_id = t2.user_id
left join Customers t3 on t2.contact_email = t3.email
group by invoice_id,price,t1.user_id
order by 1 asc
;
























