
-- DATA RETRIEVAL USING SINGLE TABLE

# Learning Select, where,distinct,like,between,and,or,in

select * from moviesdb.movies;

USE moviesdb;  # referring to particular db for all below queries
select title, industry from movies;

# movies which are only bollywood
select title, industry from movies where industry="bollywood";

# count of bollywood movies
select count(*) from movies where industry="bollywood";

# unique industries in the DB
select distinct(industry) from movies;

#if in title starts with thor
select * from movies where title like "t%";

#if in title ends with thor
select * from movies where title like "%t";

# if in title thor appers somewhere then print those rows
select * from movies where title like "%thor%";

# get movies where we do not want to watch movies which have rating less than 6
select title from movies where imdb_rating<6;

# get movies where we want to watch movies which have rating between 6 and 8 
select title from movies where imdb_rating between 6 and 8;

# get movies where we want to see titles which released in year 2018 or 2019
SELECT title,release_year
FROM movies
WHERE release_year=2018 or release_year=2019;

# get movies where we want to see titles which released in year 2018,2019,2020,2021,2022
SELECT title,release_year
FROM movies
WHERE release_year in(2018,2019,2020,2021,2022);

# get movies where we want to see titles which has the imdb ratings values present in it
SELECT title,imdb_rating
FROM movies
WHERE imdb_rating is not null;

# get movies where we want to see the titles in the highest order of ratings
SELECT title,imdb_rating
FROM movies
ORDER BY imdb_rating DESC;

# get movies where we want to see the first 5 titles in the highest order of ratings
SELECT title,imdb_rating
FROM movies
ORDER BY imdb_rating DESC
LIMIT 5;

# get movies where we want to see the second 5 titles in the highest order of ratings 
SELECT title,imdb_rating
FROM movies
ORDER BY imdb_rating DESC
LIMIT 5
offset 1;  # generally index starts from 1.
























