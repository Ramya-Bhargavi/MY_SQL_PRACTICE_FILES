#COMMON TABLE EXPRESSIONS:


# get all actors whose age is between 70 and 85 --- ask as questn

select * from (
select
name,year(curdate())-birth_year as age
from actors ) as age_name
where age >70 and age <85 ;


# Using CTE
with actors_age as
(select
name,year(curdate())-birth_year as age
from actors)

select name,age 
from actors_age
where age>70 and age<85;

#--- CTE IN PPT

#-- valid only till the scope of statement 

#ERROR
select name,age 
from actors_age;

# we can get the columns names in the with clause also...
with actors_age (actorname,act_age) as
(select
name,year(curdate())-birth_year as age
from actors)

select actorname,act_age 
from actors_age
where act_age>70 and act_age<85;


# we can use direct paramter name but not the alisases inside original table
# if we are defining both internally and externally
#ERRORRRRR
with actors_age (actorname,act_age) as
(select
name as x,
year(curdate())-birth_year as y
from actors)


select x,y 
from actors_age
where y>70 and y<85;


select actor_name
from actors_age
where actor_name like "r%";

# complex joins between two tables outputs
# 1. movies that produced 500 % profit and their rating was less than avg rating for all movies

# step-1 :
# movies that produced 500 % profit or more

# errror becos where is executed first
select *,revenue-budget*100/budget as pct_profit
from financials
where pct_profit >=500;

select
*,revenue-budget*100/budget as pct_profit
from financials
where revenue-budget*100/budget>=500;

# step 2:
# movies their rating was less than avg rating
select * from movies 
where imdb_rating < ( select avg(imdb_rating) from movies);

# step 3:
# now we are combining two queries

# see both the tables and we have movie_id as common, so if we join them we get result

select * from 
( 
select
*,revenue-budget*100/budget as pct_profit
from financials
where revenue-budget*100/budget>=500
) x
join
(select * from movies 
where imdb_rating < ( select avg(imdb_rating) from movies)
) y
on x.movie_id = y.movie_id;

# step 4:
# selecting required cols


select  x.movie_id,x.pct_profit,y.title,y.imdb_rating from 
( 
select
*,revenue-budget*100/budget as pct_profit
from financials
where revenue-budget*100/budget>=500
) x
join
(select * from movies 
where imdb_rating < ( select avg(imdb_rating) from movies)
) y
on x.movie_id = y.movie_id;

# using multiple cte's like x,y here and  making it easy

with x as(
select
*,revenue-budget*100/budget as pct_profit
from financials
where revenue-budget*100/budget>=500
),

y as(
select * from movies 
where imdb_rating < ( select avg(imdb_rating) from movies)
)


select  x.movie_id,x.pct_profit,y.title,y.imdb_rating
from x
join y on x.movie_id= y.movie_id;