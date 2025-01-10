-- 1. Count the number of Movies VS TV Shows

create view `Number of Movies VS TV Shows` as
select type, count(*) as Count
from amazon_prime_videos
group by type;

select * from `Number of Movies VS TV Shows`;


-- 2. Find the most common rating for movies and TV shows

create view `common rating for movies and TV shows` as
select type, rating
from
(
	select type, rating, count(*) as count, 
	rank() over(partition by type order by count(*) desc) as ranking
	from amazon_prime_videos
	group by type, rating
) as t1
where ranking = 1;

select * from `common rating for movies and TV shows`;


-- 3. List all movies released in 2020

create view `Movies released in 2020` as
select type, title, release_year 
from amazon_prime_videos
where type = 'Movie' and release_year = 2020;

select * from `Movies released in 2020`;


-- 4. Find the top 5 countries with the most content on Amazon Prime Video

create view `Top 5 countries with the most content on Amazon Prime Video` as
select * 
from (
	select country, count(show_id) as total_content
	from amazon_prime_videos
	where country != 'null'
	group by 1
    order by 2 DESC
    LIMIT 5
) as t2;

select * from `Top 5 countries with the most content on Amazon Prime Video`;


-- 5. Identify the longest movie

create view `longest movies` as
select type, title, duration 
from amazon_prime_videos
where type = 'Movie' and duration = 113;

select * from `longest movies`;


-- 6. Find content added on March 30, 2021

create view `content added on March 30, 2021` as
select type, title, date_added 
from amazon_prime_videos
where date_added = 'March 30, 2021';

select * from `content added on March 30, 2021`;


-- 7. Find all the movies directed by 'Aaron Michael'

create view `movies directed by 'Aaron Michael'` as
select type, title, director
from amazon_prime_videos
where director = 'Aaron Michael';

select * from `movies directed by 'Aaron Michael'`;

-- 8. List all TV shows in India

create view `all TV shows listen in India` as
select type, title, country
from amazon_prime_videos
where type = 'TV Show' and country = 'India';

select * from `all TV shows listen in India`;


-- 9. Count the number of content items in each genre

create view `number of content items in each genre` as 
select listed_in, count(*) as total_content
from amazon_prime_videos
group by 1;

select * from `number of content items in each genre`;


-- 10. List all unrated movies

create view `unrated movies` as
select type, title, rating
from amazon_prime_videos
where type = 'Movie' and rating = 'UNRATED';

select * from `unrated movies`;