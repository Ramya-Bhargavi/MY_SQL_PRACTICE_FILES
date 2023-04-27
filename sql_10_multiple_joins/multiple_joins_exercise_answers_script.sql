# step 1:
select * from movies;

select * from languages;

select * from financials;

#step 2: 
select * from movies m
left join languages l
on m.language_id=l.language_id
where l.name="Hindi";

#step 3:
select * from movies m
left join languages l on m.language_id=l.language_id
left join financials f on m.movie_id=f.movie_id
where l.name="Hindi";

# step 4:
select m.title,
  case 
   when unit="thousands" then revenue/1000
   when unit="Billions" then revenue*1000
    else revenue
   end as revenue_miln,
 currency, revenue,unit
from movies m
left join languages l on m.language_id=l.language_id
left join financials f on m.movie_id=f.movie_id
where l.name="Hindi"
ORDER BY revenue_miln DESC;
