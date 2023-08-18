Table: salesperson
+----------+------+--------+-----------------+-----------+
| sales_id | name | salary | commission_rate | hire_date |
+----------+------+--------+-----------------+-----------+
|   1      | John | 100000 |     6           | 4/1/2006  |
|   2      | Amy  | 120000 |     5           | 5/1/2010  |
|   3      | Mark | 65000  |     12          | 12/25/2008|
|   4      | Pam  | 25000  |     25          | 1/1/2005  |
|   5      | Alex | 50000  |     10          | 2/3/2007  |
+----------+------+--------+-----------------+-----------+
The table salesperson holds the salesperson information. Every salesperson has a sales_id and a name.

DROP TABLE IF EXISTS salesperson;
CREATE TABLE IF NOT EXISTS salesperson (
	sales_id int,
	name varchar(100)
);

INSERT INTO salesperson(sales_id, name) VALUES(1 , 'John');
INSERT INTO salesperson(sales_id, name) VALUES(2 , 'Amy ');
INSERT INTO salesperson(sales_id, name) VALUES(3 , 'Mark');
INSERT INTO salesperson(sales_id, name) VALUES(4 , 'Pam ');
INSERT INTO salesperson(sales_id, name) VALUES(5 , 'Alex');

Table: company
+---------+--------+------------+
| com_id  |  name  |    city    |
+---------+--------+------------+
|   1     |  RED   |   Boston   |
|   2     | ORANGE |   New York |
|   3     | YELLOW |   Boston   |
|   4     | GREEN  |   Austin   |
+---------+--------+------------+
The table company holds the company information. Every company has a com_id and a name.

DROP TABLE IF EXISTS company;
CREATE TABLE IF NOT EXISTS company (
	com_id int,
	name varchar(100)
);
INSERT INTO company(com_id, name) VALUES(1 ,'RED');
INSERT INTO company(com_id, name) VALUES(2 ,'ORANGE');
INSERT INTO company(com_id, name) VALUES(3 ,'YELLOW');
INSERT INTO company(com_id, name) VALUES(4 ,'GREEN');

Table: orders
+----------+------------+---------+----------+--------+
| order_id | order_date | com_id  | sales_id | amount |
+----------+------------+---------+----------+--------+
| 1        |   1/1/2014 |    3    |    4     | 100000 |
| 2        |   2/1/2014 |    4    |    5     | 5000   |
| 3        |   3/1/2014 |    1    |    1     | 50000  |
| 4        |   4/1/2014 |    1    |    4     | 25000  |
+----------+----------+---------+----------+--------+
The table orders holds the sales record information, salesperson and customer company are represented by sales_id and com_id.
Question: Find the names of all the salespersons who did not have any orders related to the company with the name "RED"

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders (
	com_id int,
	sales_id int
);

INSERT INTO orders(com_id, sales_id) VALUES(3 ,4);
INSERT INTO orders(com_id, sales_id) VALUES(4 ,5);
INSERT INTO orders(com_id, sales_id) VALUES(1 ,1);
INSERT INTO orders(com_id, sales_id) VALUES(1 ,4);

select
	name 
from salesperson
where sales_id not in 
	(select 
		t1.sales_id
	from orders t1, company t2 
	where t1.com_id = t2.com_id
	and t2.name = 'RED'
	)
;
	















