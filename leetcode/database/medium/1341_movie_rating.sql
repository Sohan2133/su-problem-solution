Table : Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+

DROP TABLE IF EXISTS Movies;
CREATE TABLE IF NOT EXISTS Movies (
	movie_id int,
	title varchar
);


INSERT INTO Movies values(1,'Avengers');
INSERT INTO Movies values(2,'Frozen 2');
INSERT INTO Movies values(3,'Joker   ');

Table: Users 
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
DROP TABLE IF EXISTS Users;
CREATE TABLE IF NOT EXISTS Users (
	user_id int,
	name varchar
);

INSERT INTO Users values(1, 'Daniel');
INSERT INTO Users values(2, 'Monica');
INSERT INTO Users values(3, 'Maria ');
INSERT INTO Users values(4, 'James ');

Table: Movie_Rating
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
DROP TABLE IF EXISTS Movie_Rating;
CREATE TABLE IF NOT EXISTS Movie_Rating (
	movie_id int,
	user_id int,
	rating int,
	created_at date
);

INSERT INTO Movie_Rating values(1,1, 3, '2020-01-12');
INSERT INTO Movie_Rating values(1,2, 4, '2020-02-11');
INSERT INTO Movie_Rating values(1,3, 2, '2020-02-12');
INSERT INTO Movie_Rating values(1,4, 1, '2020-01-01');
INSERT INTO Movie_Rating values(2,1, 5, '2020-02-17');
INSERT INTO Movie_Rating values(2,2, 2, '2020-02-01');
INSERT INTO Movie_Rating values(2,3, 2, '2020-03-01');
INSERT INTO Movie_Rating values(3,1, 3, '2020-02-22');
INSERT INTO Movie_Rating values(3,2, 4, '2020-02-25');

First Solution:
---------------------------------------
(select 
	name as results
from Users
where user_id in (
select 
	user_id
from Movie_Rating
where rating in (select max(rating) from Movie_Rating)
) order by 1 asc limit 1)

union

(select 
	title as results
from Movies 
where movie_id in 
(
	select 
		movie_id
	from Movie_Rating
	where extract(year from created_at) = 2020
	and extract(month from created_at) = 2
	group by 1 
	having avg(rating) in 
		(select
			avg(rating) avg  
		from Movie_Rating
		where extract(year from created_at) = 2020
		and extract(month from created_at) = 2
		group by movie_id
		order by 1 desc limit 1)
)
order by 1 asc limit 1)
;

Second Solution:
-----------------------------------

(select 
	name 
from Users left join Movie_Rating using(user_id)
order by rating desc, name asc limit 1)
union
(select 
	title
from Movies t1 left join Movie_Rating t2 using(movie_id)
where extract(year from created_at) = 2020
and extract(month from created_at) = 2
group by 1 
order by avg(rating) desc, title asc limit 1)
;


























