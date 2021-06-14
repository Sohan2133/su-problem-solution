Table: Sales

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| sale_id      | int     |
| product_name | varchar |
| sale_date    | date    |
+--------------+---------+

DROP TABLE IF EXISTS Sales;
CREATE TABLE IF NOT EXISTS Sales (
	sale_id int,
	product_name varchar,
	sale_date date
);



INSERT INTO Sales values(1,'     LCPHONE   ','2000-01-16');
INSERT INTO Sales values(2,'   LCPhone     ','2000-01-17');
INSERT INTO Sales values(3,'    LcPhOnE    ','2000-02-18');
INSERT INTO Sales values(4,'     LCKeyCHAiN','2000-02-19');
INSERT INTO Sales values(5,'  LCKeyChain   ','2000-02-28');
INSERT INTO Sales values(6,'Matryoshka     ','2000-03-31');

select 
	lower(trim(product_name)) as product_name,
	substring(sale_date::varchar, 1,7) as sale_date,
	count(*)
from Sales
group by 1,2
order by product_name asc, sale_date asc
;
