-- Question 59
-- Table: Movies

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+
-- movie_id is the primary key for this table.
-- title is the name of the movie.
-- Table: Users

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+
-- user_id is the primary key for this table.
-- Table: Movie_Rating

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+
-- (movie_id, user_id) is the primary key for this table.
-- This table contains the rating of a movie by a user in their review.
-- created_at is the user's review date. 
 

-- Write the following SQL query:

-- Find the name of the user who has rated the greatest number of the movies.
-- In case of a tie, return lexicographically smaller user name.

-- Find the movie name with the highest average rating in February 2020.
-- In case of a tie, return lexicographically smaller movie name.

-- Query is returned in 2 rows, the query result format is in the folowing example:

-- Movies table:
-- +-------------+--------------+
-- | movie_id    |  title       |
-- +-------------+--------------+
-- | 1           | Avengers     |
-- | 2           | Frozen 2     |
-- | 3           | Joker        |
-- +-------------+--------------+

-- Users table:
-- +-------------+--------------+
-- | user_id     |  name        |
-- +-------------+--------------+
-- | 1           | Daniel       |
-- | 2           | Monica       |
-- | 3           | Maria        |
-- | 4           | James        |
-- +-------------+--------------+

-- Movie_Rating table:
-- +-------------+--------------+--------------+-------------+
-- | movie_id    | user_id      | rating       | created_at  |
-- +-------------+--------------+--------------+-------------+
-- | 1           | 1            | 3            | 2020-01-12  |
-- | 1           | 2            | 4            | 2020-02-11  |
-- | 1           | 3            | 2            | 2020-02-12  |
-- | 1           | 4            | 1            | 2020-01-01  |
-- | 2           | 1            | 5            | 2020-02-17  | 
-- | 2           | 2            | 2            | 2020-02-01  | 
-- | 2           | 3            | 2            | 2020-03-01  |
-- | 3           | 1            | 3            | 2020-02-22  | 
-- | 3           | 2            | 4            | 2020-02-25  | 
-- +-------------+--------------+--------------+-------------+

-- Result table:
-- +--------------+
-- | results      |
-- +--------------+
-- | Daniel       |
-- | Frozen 2     |
-- +--------------+

-- Daniel and Maria have rated 3 movies ("Avengers", "Frozen 2" and "Joker") but Daniel is smaller lexicographically.
-- Frozen 2 and Joker have a rating average of 3.5 in February but Frozen 2 is smaller lexicographically.

-- Solution
select name as results
from(
(select a.name
from(
select name, count(*),
rank() over(order by count(*) desc) as rk
from movie_rating m
join users u 
on m.user_id = u.user_id
group by name, m.user_id
order by rk, name) a
limit 1)
union
(select title
from(
select title, round(avg(rating),1) as rnd
from movie_rating m
join movies u
on m.movie_id = u.movie_id
where month(created_at) = 2
group by title
order by rnd desc, title) b
limit 1)) as d
-------------------------------------------------


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


























