select *
from moviesdb.movies;

select max(imdb_rating)
from moviesdb.movies;

select max(imdb_rating)
from moviesdb.movies where studio="Marvel Studios";

select round(avg(imdb_rating),2)
from moviesdb.movies where studio="Marvel Studios";

select imdb_rating,title
from moviesdb.movies
order by imdb_rating desc
limit 1;

select count(*)
from moviesdb.movies
where industry="hollywood";

select count(*)
from moviesdb.movies
where industry="bollywood";

select count(*)
from moviesdb.movies
group by industry;

select count(*),industry
from moviesdb.movies
group by industry;


select count(*),industry
from moviesdb.movies
group by industry;

select count(*),industry,studio
from moviesdb.movies
group by industry,studio;

select max(imdb_rating) as cnt,industry,studio
from moviesdb.movies
group by industry,studio
having cnt > 5





