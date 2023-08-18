Table : product
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
| unit_price   | int     |
+--------------+---------+

DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product (
	product_id int,
	product_name varchar(100),
	unit_price int
);

INSERT INTO product(product_id, product_name, unit_price) VALUES(1,'S8'    ,1001);  
INSERT INTO product(product_id, product_name, unit_price) VALUES(2,'G4'    ,802 );  
INSERT INTO product(product_id, product_name, unit_price) VALUES(3,'iPhone',1403);

Table: Sales
----------+---------+
| Column Name | Type    |
+-------------+---------+
| seller_id   | int     |
| product_id  | int     |
| buyer_id    | int     |
| sale_date   | date    |
| quantity    | int     |
| price       | int     |
+------ ------+---------+
Question: Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table.

DROP TABLE IF EXISTS Sales;
CREATE TABLE IF NOT EXISTS Sales (
	seller_id int,
	product_id int,
	buyer_id int,
	sale_date date,
	quantity int,
	price int 
);

INSERT INTO Sales VALUES(1,1,1,'2019-01-21', 2 ,2000);
INSERT INTO Sales VALUES(1,2,2,'2019-02-17', 1 ,800 );
INSERT INTO Sales VALUES(2,1,3,'2019-06-02', 1 ,800 );
INSERT INTO Sales VALUES(3,3,3,'2019-05-13', 2 ,2800);

select 
	buyer_id
from 
(select 
	t1.buyer_id,
	sum(case when t2.product_name = 'S8' then 1 else 0 end) as s8_count,
	sum(case when t2.product_name = 'iPhone' then 1 else 0 end) as i_count
from Sales t1 join product t2 
on t1.product_id = t2.product_id
group by 1)t 
where s8_count > 0 and i_count = 0
;


