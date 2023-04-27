
# q: get the count of movies acted by an actor


select a.actor_id,a.name,count(*) as movies_count
from movie_actor ma
join actors a
on a.actor_id =ma.actor_id
group by a.actor_id
order by movies_count desc;

# q: get the count of movies acted by an actor by using corelated subquery
select * from actors;

# step 1:
select actor_id,name, --- movie_count---
from actors;

# step 2
# movie_count
select count(*) from movie_actor where actor_id =51;

# step 3:
select
  actor_id,
  name,
  (select count(*) from movie_actor where actor_id = actors.actor_id) as movies_count
from actors;

# here execution depends on outer query

# explain analyze ---- how much your query is taking time by using which syntaxes
explain analyze
select
  actor_id,
  name,
  (select count(*) from movie_actor where actor_id = actors.actor_id) as movies_count
from actors; 

# after running in the output right click and press click open value in viewer

explain analyze
select a.actor_id,a.name,count(*) as movies_count
from movie_actor ma
join actors a
on a.actor_id =ma.actor_id
group by a.actor_id
order by movies_count desc;

 