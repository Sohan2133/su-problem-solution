Table:OrdersDetails
+-------------+------+
| Column Name | Type |
+-------------+------+
| order_id    | int  |
| product_id  | int  |
| quantity    | int  |
+-------------+------+

DROP TABLE IF EXISTS OrdersDetails;
CREATE TABLE IF NOT EXISTS OrdersDetails (
	order_id int,
	product_id int,
	quantity int 
);


INSERT INTO OrdersDetails values(1, 1, 12);
INSERT INTO OrdersDetails values(1, 2, 10);
INSERT INTO OrdersDetails values(1, 3, 15);
INSERT INTO OrdersDetails values(2, 1, 8 );
INSERT INTO OrdersDetails values(2, 4, 4 );
INSERT INTO OrdersDetails values(2, 5, 6 );
INSERT INTO OrdersDetails values(3, 3, 5 );
INSERT INTO OrdersDetails values(3, 4, 18);
INSERT INTO OrdersDetails values(4, 5, 2 );
INSERT INTO OrdersDetails values(4, 6, 8 );
INSERT INTO OrdersDetails values(5, 7, 9 );
INSERT INTO OrdersDetails values(5, 8, 9 );
INSERT INTO OrdersDetails values(3, 9, 20);
INSERT INTO OrdersDetails values(2, 9, 4 );

First Solution:
-------------------

select
	order_id
from OrdersDetails
group by 1 
having max(quantity) > (select 
							max(avg) as max_avg
						from 
							(select 
								order_id,
								sum(quantity)*1.0 / count(*) as avg
							from OrdersDetails
							group by 1 
							) t 
						)
;

Second Solution:
---------------------
select
	order_id
from OrdersDetails
group by 1 
having max(quantity) > all (select sum(quantity)*1.0 / count(*) as avg from OrdersDetails group by order_id)
;


