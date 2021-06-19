Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+

DROP TABLE IF EXISTS Products;
CREATE TABLE IF NOT EXISTS Products (
	product_id int,
	new_price int,
	change_date date 
);


INSERT INTO Products values(1, 20, '2019-08-14');
INSERT INTO Products values(2, 50, '2019-08-14');
INSERT INTO Products values(1, 30, '2019-08-15');
INSERT INTO Products values(1, 35, '2019-08-16');
INSERT INTO Products values(2, 65, '2019-08-17');
INSERT INTO Products values(3, 20, '2019-08-18');

select 
	t2.product_id,
	case when t1.product_id is null then 10 else t1.new_price end as price 
from 
	(select 
		*,
		row_number() over(partition by product_id order by change_date desc) as rn  
	from Products
	where change_date <= '2019-08-16'
	) t1 right join (select distinct product_id from Products) t2 
on t1.product_id = t2.product_id
where rn = 1 or rn is null 
;