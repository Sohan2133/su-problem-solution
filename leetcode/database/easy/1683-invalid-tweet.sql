Table: Tweets
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| tweet_id       | int     |
| content        | varchar |
+----------------+---------+

DROP TABLE IF EXISTS Tweets;
CREATE TABLE IF NOT EXISTS Tweets (
	tweet_id int,
	content varchar
);

INSERT INTO Tweets values(1,'Vote for Biden');
INSERT INTO Tweets values(2,'Let us make America great again!');

select 
	tweet_id
from Tweets
where char_length(content) > 15;


----Sohan's Solution---

select
	tweet_id
from tweets
where len(content)>15 ;

