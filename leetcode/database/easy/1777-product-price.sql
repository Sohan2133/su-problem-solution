Products
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| store       | enum    |
| price       | int     |
+-------------+---------+
----(product_id,store) is the primary key for this table.
--store is an ENUM of type ('store1', 'store2', 'store3') where each represents the store this product is available at.
---price is the price of the product at this store.
--Write an SQL query to find the price of each product in each store.
DROP TABLE IF EXISTS Products;
CREATE TABLE IF NOT EXISTS Products (
	product_id int,
	store varchar,
	price int 
);



INSERT INTO Products values(0, 'store1', 95 );
INSERT INTO Products values(0, 'store3', 105);
INSERT INTO Products values(0, 'store2', 100);
INSERT INTO Products values(1, 'store1', 70 );
INSERT INTO Products values(1, 'store3', 80 );

select 
	product_id,
	sum(case when store = 'store1' then price else 0 end) as store1,
	sum(case when store = 'store2' then price else 0 end) as store2,
	sum(case when store = 'store3' then price else 0 end) as store3
from Products
group by product_id

---Sohan's Solution---

select
product_id,
sum(case when store = 'store1' then price else null end) as store1,
sum(case when store = 'store2' then price else null end) as store2,
sum(case when store = 'store3' then price else null end) as store3
from `query_solving2144.product_price`
group by product_id;