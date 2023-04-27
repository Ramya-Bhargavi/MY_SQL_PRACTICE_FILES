select * from movies
where industry ="hollywood" and release_year > 2000;

select * from financials;

select (revenue-budget) as profit,unit from financials;

select m.movie_id,m.title,(f.revenue-f.budget) as profit,f.unit from movies m
join financials f on m.movie_id=f.movie_id
where industry ="hollywood" and release_year > 2000 and (f.revenue-f.budget) > 500;

#using CTE
with cte as (

select m.movie_id,m.title,(f.revenue-f.budget) as profit,f.unit from movies m
join financials f on m.movie_id=f.movie_id
where industry ="hollywood" and release_year>2000

)
select * from cte where profit>500;

# sample query from previous concepts


#Write a query to select most youngest and oldest 3 actors from our movies database
(SELECT name, birth_year FROM actors ORDER BY birth_year ASC LIMIT 3)

UNION 

(SELECT name, birth_year FROM actors ORDER BY birth_year DESC LIMIT 3);

SELECT DISTINCT(imdb_rating) FROM movies ORDER BY imdb_rating DESC LIMIT 6 offset 1