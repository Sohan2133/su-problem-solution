Table: Books
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| book_id        | int     |
| name           | varchar |
| available_from | date    |
+----------------+---------+

DROP TABLE IF EXISTS Books;
CREATE TABLE IF NOT EXISTS Books (
	book_id int,
	name varchar,
	available_from date
);


INSERT INTO Books values(1 ,'Kalila And Demna','2010-01-01');
INSERT INTO Books values(2 ,'28 Letters'      ,'2012-05-12');
INSERT INTO Books values(3 ,'The Hobbit'      ,'2019-06-10');
INSERT INTO Books values(4 ,'13 Reasons Why'  ,'2019-06-01');
INSERT INTO Books values(5 ,'The Hunger Games','2008-09-21');

Table: Orders 
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| order_id       | int     |
| book_id        | int     |
| quantity       | int     |
| dispatch_date  | date    |
+----------------+---------+

DROP TABLE IF EXISTS Orders;
CREATE TABLE IF NOT EXISTS Orders (
	order_id int,
	book_id int,
	quantity int,
	dispatch_date date 
);


INSERT INTO Orders values(1, 1, 2, '2018-07-26');
INSERT INTO Orders values(2, 1, 1, '2018-11-05');
INSERT INTO Orders values(3, 3, 8, '2019-06-11');
INSERT INTO Orders values(4, 4, 6, '2019-06-05');
INSERT INTO Orders values(5, 4, 5, '2019-06-20');
INSERT INTO Orders values(6, 5, 9, '2009-02-02');
INSERT INTO Orders values(7, 5, 8, '2010-04-13');

select
	t1.book_id,
	t2.book_name
from Books t1 join Orders t2 on t1.book_id = t2.book_id
where t1.available_from < ''
and dispatch_date between '2018-01-01' and '2018-12-31'
group by 1,2
having sum(quantity) < 10
;







