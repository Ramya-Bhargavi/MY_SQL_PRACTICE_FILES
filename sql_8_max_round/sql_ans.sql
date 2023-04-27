select *
from moviesdb.movies;

#1
select max(imdb_rating)
from moviesdb.movies;

#2 ERROR
select max(imdb_rating),title 
from moviesdb.movies;

#3
select imdb_rating,title
from moviesdb.movies
order by imdb_rating desc
limit 1;

#4
select min(imdb_rating)
from moviesdb.movies where studio="Marvel Studios";

#5
select avg(imdb_rating)
from moviesdb.movies where studio="Marvel Studios";

#6
select round(avg(imdb_rating),2)
from moviesdb.movies where studio="Marvel Studios";

#7
select avg(imdb_rating),min(imdb_rating),max(imdb_rating)
from moviesdb.movies where studio="Marvel Studios";

#7.
select avg(imdb_rating),min(imdb_rating),max(imdb_rating)
from moviesdb.movies 
where studio="Marvel Studios"
order by imdb_rating;

#8.
select count(*)
from moviesdb.movies
where industry="hollywood";

#9.
select count(*)
from moviesdb.movies
where industry="bollywood";

#10.
select count(*)
from moviesdb.movies
group by industry;

#11.
select count(*),industry
from moviesdb.movies
group by industry;

select count(*),industry
from moviesdb.movies
group by industry;

#12.
select avg(imdb_rating),min(imdb_rating),max(imdb_rating),studio
from moviesdb.movies 
where studio !=""
group by studio;

select nullif(movie_id, ''),TITLE,industry,release_year,nullif(imdb_rating,''),studio,language_id
from moviesdb.movies
where studio !="" and imdb_rating is not null;

#13.
select avg(imdb_rating),min(imdb_rating),max(imdb_rating),studio
from moviesdb.movies 
where studio="Marvel Studios"
group by studio
order by imdb_rating;

#13. 
select sum(imdb_rating) as cnt,industry,studio
from moviesdb.movies
group by industry,studio
having cnt > 5
order by cnt;

#14. here the where clause is executed first so the values are not there in marvel studios which are greater than 5
select sum(imdb_rating) as cnt,industry,studio
from moviesdb.movies
where imdb_rating >=8
group by industry,studio
having cnt > 5
order by cnt;




