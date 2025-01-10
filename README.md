# Amazon Prime Movies and TV Shows Data Analysis Using SQL
# Project Overview
This project analyzes a dataset containing information about movies and TV shows available on Amazon Prime Video.
Using SQL, the goal is to extract valuable insights, explore trends, and answer business-related questions based on the data.
The analysis can assist Amazon Prime in content strategy, viewer preferences, and market trends.
# Objectives
- Analyzing the catalog of Amazon Prime Video, including genres, ratings, release years, and content type (movie or TV show).
- Identifying key trends, such as genre popularity and the distribution of content across different countries.
- Answering business-driven questions to help Amazon Prime improve its content offerings and user engagement.
# Dataset
The data for this project is sourced from the Kaggle dataset:
Dataset Link: [Dataset](https://www.kaggle.com/datasets/shivamb/amazon-prime-movies-and-tv-shows?resource=download)
# Business Problems and Solutions
1. Count the number of Movies VS TV Shows
```sql
select type, count(*) as Count
from amazon_prime_videos
group by type;
```

2. Find the most common rating for movies and TV shows
```sql
select type, rating
from
(
	select type, rating, count(*) as count, 
	rank() over(partition by type order by count(*) desc) as ranking
	from amazon_prime_videos
	group by type, rating
) as t1
where ranking = 1;
```

3. List all movies released in 2020
```sql
select type, title, release_year 
from amazon_prime_videos
where type = 'Movie' and release_year = 2020;
```

4. Find the top 5 countries with the most content on Amazon Prime Video

```sql
select * 
from (
	select country, count(show_id) as total_content
	from amazon_prime_videos
	where country != 'null'
	group by 1
    order by 2 DESC
    LIMIT 5
) as t2;
```

5. Identify the longest movie

```sql
select type, title, duration 
from amazon_prime_videos
where type = 'Movie' and duration = 113;
```

6. Find content added on March 30, 2021

```sql
select type, title, date_added 
from amazon_prime_videos
where date_added = 'March 30, 2021';
```

7. Find all the movies directed by 'Aaron Michael'

```sql
select type, title, director
from amazon_prime_videos
where director = 'Aaron Michael';
```

8. List all TV shows in India

```sql
select type, title, country
from amazon_prime_videos
where type = 'TV Show' and country = 'India';
```

9. Count the number of content items in each genre

```sql
select listed_in, count(*) as total_content
from amazon_prime_videos
group by 1;
```

10. List all unrated movies

```sql
select type, title, rating
from amazon_prime_videos
where type = 'Movie' and rating = 'UNRATED';
```
