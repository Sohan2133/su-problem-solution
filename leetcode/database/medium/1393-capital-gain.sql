Table: Stock
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| stock_name    | varchar |
| operation     | enum    |
| operation_day | int     |
| price         | int     |
+---------------+---------+

DROP TABLE IF EXISTS Stock;
CREATE TABLE IF NOT EXISTS Stock (
	stock_name varchar,
	operation varchar,
	operation_day int,
	price int 
);


INSERT INTO Stock values('Leetcode    ','Buy ', 1 ,1000 );
INSERT INTO Stock values('Corona Masks','Buy ', 2 ,10   );
INSERT INTO Stock values('Leetcode    ','Sell', 5 ,9000 );
INSERT INTO Stock values('Handbags    ','Buy ', 17,30000);
INSERT INTO Stock values('Corona Masks','Sell', 3 ,1010 );
INSERT INTO Stock values('Corona Masks','Buy ', 4 ,1000 );
INSERT INTO Stock values('Corona Masks','Sell', 5 ,500  );
INSERT INTO Stock values('Corona Masks','Buy ', 6 ,1000 );
INSERT INTO Stock values('Handbags    ','Sell', 29,7000 );
INSERT INTO Stock values('Corona Masks','Sell', 10,10000);

First Solution:
---------------------
select 
	stock_name,
	(selling_price - buying_price) as gain_loss
from 
(select 
	stock_name,
	sum(case when operation = 'Sell' then price else 0 end) as selling_price,
	sum(case when operation = 'Buy ' then price else 0 end) as buying_price
from Stock
group by stock_name
) t 
;

Second Solution:
--------------------
select 
	stock_name,
	sum(case when operation='Sell' then price else -price end) as gain_loss
from Stock
group by 1 
;
