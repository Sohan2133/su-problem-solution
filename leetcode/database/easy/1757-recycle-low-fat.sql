Table: Product 
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------

select 
	product_id
from Product
where low_fats = 'Y'
and recyclable = 'Y'