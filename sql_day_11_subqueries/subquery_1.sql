# subquery

# get maximum rating from the movies 
# q1 :
select * from movies
order by imdb_rating desc
limit 1;

select * from movies 
where imdb_rating=9.3;

# q2: u know the maximum rating already and now we want to get the movie name
# getting the max rating
select max(imdb_rating) from movies;

# error with using aggregated cols without group by
select title, max(imdb_rating) from movies;

# sub query to return the max rating title 
select title,imdb_rating from movies 
where imdb_rating=(select max(movie_id) from movies);

# nested query ----it can have different levels of sub query inside it as well

# SCENARIO :1 ... query returning a single value

select max(imdb_rating) from movies; # returning only one value

# query returning muiltple values

# want the title for both min and max imdb_rating

select min(imdb_rating),max(imdb_rating) from movies;

# Scenario 2 : for muiltple values returning query we can use in operator

# query to get minimum and maxm rating for titles for movie

# query will return error because the values are returned in form of multiple cols
#ERRORRRR
select title,imdb_rating from movies 
where imdb_rating in 
(
   select min(imdb_rating),max(imdb_rating) from movies
);

# here the values will be running as two different queries so the values will be stored in the form of two different rows and imdb_rating compares with two rows

select title,imdb_rating from movies 
where imdb_rating in 
(
   (select min(imdb_rating) from movies), (select max(imdb_rating) from movies)
);


# Scenario 3: query returning a table 

# select all actors whose age is >70

select * from actors;

# ERROR 
select
name,year(curdate())-birth_year as age
from actors
where age > 70;

# first the where clause is executed then the select clause is executed so the age is not available in the where col
# so the calculation performed in select we cannnot use in where 
# so we can use either
#1. having clause without group by
#2. we use subqueries to calculate them again in subquery.. here the select is directly not performed before where, but first we can perform from


#1.
select
name,year(curdate())-birth_year as age
from actors
having age > 70;

#2. # ERRROR
select * from (
select
name,year(curdate())-birth_year as age
from actors)
where age >70;

# evry table in subquery must have an alias

select * from (
select
name,year(curdate())-birth_year as age
from actors ) as age_name
where age >70 ;

# write query for the age >70 and <85 -- exercise

# select actors who acted in any of movies with any of movie ids (101,110,121)

select * from actors;

select * from movie_actor;

select * from movies;

select *
from actors a join movie_actor ma on a.actor_id=ma.actor_id
join movies m on m.movie_id=ma.movie_id;

select a.actor_id,m.movie_id,a.name,m.title
from actors a join movie_actor ma on a.actor_id=ma.actor_id
join movies m on m.movie_id=ma.movie_id;

select a.actor_id,m.movie_id,a.name,m.title
from actors a join movie_actor ma on a.actor_id=ma.actor_id
join movies m on m.movie_id=ma.movie_id
where m.movie_id in(101,110,121);

# or we can use subquery:

select * from movie_actor;

select * from movie_actor where movie_id in(101,110,121);

select * from actors;

# ERROR
select * from actors where actor_id in
(select * from movie_actor where movie_id in(101,110,121) );

# in operator should have to match with only one column in subquery 
select * from actors where actor_id in
(select actor_id from movie_actor where movie_id in(101,110,121) );

# ANY --- similar to in operator
select * from actors where actor_id = any
(select actor_id from movie_actor where movie_id in(101,110,121));

# difference between any and in in sql in ppt

 # select actors who acted in any of movies with any of movie ids (101,110,121)
  
# if we use above query then we can see that the any clause is same as english senetnce of the query

# q : select all movies whose rating is greater than any of marvel movies rating

select imdb_rating from movies where studio="Marvel Studios";
 
select count(*) from movies 
where imdb_rating = any ( select imdb_rating from movies where studio="Marvel Studios");


#--- here the movies are selected whose rating is minimum from the list.
select count(*) from movies
where imdb_rating > any(select imdb_rating from movies where studio="Marvel Studios");

# above query and below query are equal
select count(*) from movies
where imdb_rating >(select min(imdb_rating) from movies where studio="Marvel Studios");

# q : select all movies whose rating is greater than all of marvel movies rating

#--- here the movies are selected whose rating is maximum from the list.
select count(*) from movies
where imdb_rating > all(select imdb_rating from movies where studio="Marvel Studios");

# above query and below query are equal
select count(*) from movies
where imdb_rating > (select max(imdb_rating) from movies where studio="Marvel Studios");

# q: get the count of movies acted by an actor

select a.actor_id,a.name,count(*) as movies_count
from movie_actor ma
join actors a
on a.actor_id =ma.actor_id
group by a.actor_id
order by movies_count desc;

# ------- observe the above query and see if u observe any rule violation but still the query is running

# there are some exceptions in some of mysql queries like above we also included some cols in select which are not there in group by ---
# this is only done sometimes where even after gruping the query dont produce multiple values for select

















