Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| name        | varchar |
+-------------+---------+

DROP TABLE IF EXISTS Product;
CREATE TABLE IF NOT EXISTS Product (
	product_id int,
	name varchar
);

INSERT INTO Product values(0,'ham  ');
INSERT INTO Product values(1,'bacon');

Table: Invoice
+-------------+------+
| Column Name | Type |
+-------------+------+
| invoice_id  | int  |
| product_id  | int  |
| rest        | int  |
| paid        | int  |
| canceled    | int  |
| refunded    | int  |
+-------------+------+
DROP TABLE IF EXISTS Invoice;
CREATE TABLE IF NOT EXISTS Invoice (
	invoice_id int,
	product_id int,
	rest int ,
	paid int,
	canceled int,
	refunded int 
);



INSERT INTO Invoice values(23, 0, 2, 0, 5, 0);
INSERT INTO Invoice values(12, 0, 0, 4, 0, 3);
INSERT INTO Invoice values(1 , 1, 1, 1, 0, 1);
INSERT INTO Invoice values(2 , 1, 1, 0, 1, 1);
INSERT INTO Invoice values(3 , 1, 0, 1, 1, 1);
INSERT INTO Invoice values(4 , 1, 1, 1, 1, 0);

select 
	name,
	sum(rest) as rest,
	sum(paid) as paid,
	sum(canceled) as canceled,
	sum(refunded) as refunded
from Invoice t1 join Product t2 on t1.product_id = t2.product_id
group by 1