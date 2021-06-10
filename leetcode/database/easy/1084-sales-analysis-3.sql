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
INSERT INTO Sales VALUES(2,2,3,'2019-06-02', 1 ,800 );
INSERT INTO Sales VALUES(3,3,3,'2019-05-13', 2 ,2800);

select 
	product_id,
	product_name
from
(	select 
		t1.product_id, 
		t2.product_name,
		sum(case when t1.sale_date >= '2019-01-01' and t1.sale_date <= '2019-03-01' then 1 else 0 end) as spring_sold_count, 
		count(*) as total_count
	from Sales t1 left join product t2 on t1.product_id=t2.product_id
	group by 1,2
) t
where spring_sold_count = total_count
;
