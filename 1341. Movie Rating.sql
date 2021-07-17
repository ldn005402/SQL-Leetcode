(select name as results
from movie_rating as mr1 left join users as u
on mr1.user_id = u.user_id
group by mr1.user_id
order by count(movie_id) desc, name
limit 1)

union

(select title as results
from movie_rating as mr left join movies as m
on mr.movie_id = m.movie_id
where MONTH(created_at) = 2 and YEAR(created_at) = 2020
group by mr.movie_id
order by avg(rating) desc, title
limit 1);
