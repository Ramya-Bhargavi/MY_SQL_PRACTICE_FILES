select * from movies;

select * from movie_actor;

select * from actors;

#1 start from the movies table
select * from 
movies m left join movie_actor ma on m.movie_id=ma.movie_id
left join actors a on ma.actor_id = a.actor_id;

# get only movies title and actor

select m.title,a.name from 
movies m left join movie_actor ma on m.movie_id=ma.movie_id
left join actors a on ma.actor_id = a.actor_id;

# we need actors for the movies in the same order 
select m.title ,a.name 
from movies m
left join movie_actor ma on m.movie_id=ma.movie_id
left join actors a on ma.actor_id = a.actor_id
group by m.title, a. name;

# now we get the combination of names for a particular movie ---  use group concat 
select m.title ,group_concat(a.name separator ",")
from movies m
left join movie_actor ma on m.movie_id=ma.movie_id
left join actors a on ma.actor_id = a.actor_id
group by m.title;

# 2 --- start from the actors table

select a.name,m.title
from actors a
left join movie_actor ma on ma.actor_id = a.actor_id
left join movies m on m.movie_id=ma.movie_id;

select a.name, group_concat(title separator " | ")
from actors a
left join movie_actor ma on ma.actor_id = a.actor_id
left join movies m on m.movie_id=ma.movie_id
group by a.name;

#3. 
select a.name, group_concat(title separator " | "),count(a.name) as cnt
from actors a
left join movie_actor ma on ma.actor_id = a.actor_id
left join movies m on m.movie_id=ma.movie_id
group by a.name
order by cnt desc
limit 1 
offset 1;


