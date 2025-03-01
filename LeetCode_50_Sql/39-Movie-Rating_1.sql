-- solution 1
select 
    * 
from
    (
        select 
            top 1 name as results
        from 
            Users a
        join 
            MovieRating b
        on a.user_id = b.user_id
        group by 
            name
        order by 
            count(*) desc , results
        
        union all
        
        select 
            top 1 title as results
        from 
            Movies c
        join 
            MovieRating b
        on
            c.movie_id = b.movie_id
        where 
            month(created_at) =2
        and
            year(created_at) =2020
        group by 
            title
        order by avg(rating * 1.0) desc , title
    ) as res
