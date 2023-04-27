#TAKE THE PPT AND EXPLAIN THE DIAGRAMS FROM THE PPT

# TAKE THE EXAMPLE TABLE AND VALUES FROM PPT OF CUST ORDER AND MAIN TABLE AND EXAPLIAN ON BOARD
select * from moviesdb.movies;

select * from moviesdb.financials;

# after we run the movies table and financials we see that from movies table we have ##106 movie id sholay### but it is not entered in the financial table...
# now we want to see the common records which are present in both in movies and financials... there we use inner join
#1. INNER JOIN
SELECT * 
FROM movies m
INNER JOIN financials f
ON m.movie_id=f.movie_id;

# we want to see all the titles,industry and their release _years with the revenue and budget  from the movie table and see their financial details. then we do left join...
#2. LEFT JOIN
SELECT m.movie_id,industry,release_year,budget,revenue
FROM movies m
LEFT JOIN financials f
ON m.movie_id=f.movie_id;

#3. RIGHT JOIN
# we want to see all the budget, revenue information for all the movie ids along with its titles.

SELECT f.movie_id,title,industry,release_year,budget,revenue
FROM movies m
RIGHT JOIN financials f
ON m.movie_id=f.movie_id;


#4. LEFT JOIN WITHOUT COMMON VALUES AND RIGHT TABLE VALUES (A-B)
# we get all those movies which are not common from the financials table----- that means the financial table contains null values.
SELECT m.movie_id,industry,release_year,budget,revenue
FROM movies m
LEFT JOIN financials f
ON m.movie_id=f.movie_id
where f.movie_id is null;


# 5. LEFT JOIN WITHOUT COMMON VALUES AND RIGHT TABLE VALUES (B-A)
# we get all those financial tables values which are not common from the movie table table----- that means the financial table contains null values.
SELECT m.movie_id,industry,release_year,budget,revenue
FROM movies m
RIGHT JOIN financials f
ON m.movie_id=f.movie_id
where m.movie_id is null;

# 6. FULL OUTER JOIN
SELECT m.movie_id,industry,release_year,budget,revenue
FROM movies m
FULL OUTER JOIN financials f
ON m.movie_id=f.movie_id

# ERRRORRRR
# full outer joins are not present in the MYSQL SO we can use UNION opeartor and perform similar task
SELECT m.movie_id,industry,release_year,budget,revenue
FROM movies m
LEFT JOIN financials f
ON m.movie_id=f.movie_id


UNION

SELECT f.movie_id,industry,release_year,budget,revenue
FROM movies m
RIGHT JOIN financials f
ON m.movie_id=f.movie_id;

#full outer jojn with nob=nly right table and left table
SELECT m.movie_id,industry,release_year,budget,revenue
FROM movies m
LEFT JOIN financials f
ON m.movie_id=f.movie_id
where f.movie_id is null

UNION

SELECT f.movie_id,industry,release_year,budget,revenue
FROM movies m
RIGHT JOIN financials f
ON m.movie_id=f.movie_id
where m.movie_id is null;

# 7. USING WE CAN USE TO COMBINE TWO TABLES
SELECT movie_id,industry,release_year,budget,revenue
FROM movies m
LEFT JOIN financials f
USING(movie_id);

# 8. Joining using multiple columns
SELECT m.movie_id,industry,release_year,budget,revenue
FROM movies m
LEFT JOIN financials f
ON m.movie_id=f.movie_id and eg1.id=eg2.id;

# 9.Cross join
SELECT *
FROM movies m
CROSS JOIN financials f;

# 10. cross join working as inner join
SELECT m.movie_id,industry,release_year,budget,revenue
FROM movies m
CROSS JOIN financials f
WHERE m.movie_id=f.movie_id;

#11. INTERSECT
# showing red error but giving the values output
SELECT m.movie_id,industry,release_year,budget,revenue
FROM movies m
LEFT JOIN financials f
ON m.movie_id=f.movie_id

INTERSECT

SELECT f.movie_id,industry,release_year,budget,revenue
FROM movies m
RIGHT JOIN financials f
ON m.movie_id=f.movie_id;

