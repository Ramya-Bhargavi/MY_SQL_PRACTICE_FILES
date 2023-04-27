select *
from moviesdb.movies;

#1. 
#a
select release_year,count(*)
from moviesdb.movies
group by release_year;

#b. 
select release_year,count(*) as cnt
from moviesdb.movies
group by release_year
having cnt>2;

#2. 
select release_year,count(*) as cnt
from moviesdb.movies
group by release_year
having cnt>2
order by cnt;

select *
from moviesdb.actors;

#a.
select *,curdate()
from moviesdb.actors;

#b.
select *,year(curdate())
from moviesdb.actors;

#c. age
select *,year(curdate())-birth_year as age
from moviesdb.actors;

select * 
from moviesdb.financials;

#4.
select *,revenue-budget as profit 
from moviesdb.financials;

#5.
select *,IF(currency="USD", revenue*80,revenue) as revenue_inr
from moviesdb.financials;

#6.
select *,
case 
 when unit =" thousands" then revenue/1000
 when unit ="billions" then revenue*1000
 else revenue
end as revenue_millns
from moviesdb.financials;

#7.
select *,
case 
 when unit =" thousands" then revenue/1000
 when unit ="billions" then revenue*1000
 else revenue
end as revenue_millns
from moviesdb.financials
order by revenue_millns desc
limit 1
offset 1;










