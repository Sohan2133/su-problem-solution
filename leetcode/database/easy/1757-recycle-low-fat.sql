Table: Product 
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------
question: Write a solution to find the ids of products that are both low fat and recyclable.

select 
	product_id
from Product
where low_fats = 'Y'
and recyclable = 'Y'