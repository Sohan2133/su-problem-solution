+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| store1      | int     |
| store2      | int     |
| store3      | int     |
+-------------+---------+
----Write a solution to rearrange the Products table so that each row has (product_id, store, price). 
--If a product is not available in a store, do not include a row with that product_id and store combination in the result table.

DROP TABLE IF EXISTS Products;
CREATE TABLE IF NOT EXISTS Products (
	product_id int,
	store1 int,
	store2 int,
	store3 int
	
);

INSERT INTO Products values(0, 95, 100 , 105);
INSERT INTO Products values(1, 70, null, 80 );

+------------+--------+-------+
| product_id | store  | price |
+------------+--------+-------+
| 0          | store1 | 95    |
| 0          | store2 | 100   |
| 0          | store3 | 105   |
| 1          | store1 | 70    |
| 1          | store3 | 80    |
+------------+--------+-------+

select product_id, 'store1' as store , store1 as price from Products where store1 is not null 
union
select product_id, 'store2' as store , store2 as price from Products where store2 is not null
union
select product_id, 'store1' as store , store3 as price from Products where store3 is not null
order by product_id
;

----Sohan's Solution----

select product_id, 'store1' as store, store1 as price from Products where store1 is not null
union
select  product_id, 'store2' as store, store2 as price  from Products where store2 is not null  
union
select product_id, 'store3' as store, store3 as price from Products where store3 is not null
order by product_id asc;    