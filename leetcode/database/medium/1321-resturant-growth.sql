Table: Customer
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+

DROP TABLE IF EXISTS Customer;
CREATE TABLE IF NOT EXISTS Customer (
	customer_id int,
	name varchar,
	visited_on date,
	amount int
);

INSERT INTO Customer values(1, 'Jhon   ','2019-01-01',100);
INSERT INTO Customer values(2, 'Daniel ','2019-01-02',110);
INSERT INTO Customer values(3, 'Jade   ','2019-01-03',120);
INSERT INTO Customer values(4, 'Khaled ','2019-01-04',130);
INSERT INTO Customer values(5, 'Winston','2019-01-05',110); 
INSERT INTO Customer values(6, 'Elvis  ','2019-01-06',140); 
INSERT INTO Customer values(7, 'Anna   ','2019-01-07',150);
INSERT INTO Customer values(8, 'Maria  ','2019-01-08',80 );
INSERT INTO Customer values(9, 'Jaze   ','2019-01-09',110); 
INSERT INTO Customer values(1, 'Jhon   ','2019-01-10',130); 
INSERT INTO Customer values(3, 'Jade   ','2019-01-10',150);

select 
	distinct visited_on,
	(select 
		sum(amount) 
	from Customer 
	where visited_on >= t1.visited_on - interval '6'day 
		  and visited_on <= t1.visited_on)as amount,
	round((select 
		sum(amount)*1.0/7
	from Customer 
	where visited_on >=t1.visited_on - interval '6'day 
		and visited_on <= t1.visited_on),2) as avg
from Customer t1 
where visited_on >= (select min(visited_on) + interval '6' day from Customer)
;

	