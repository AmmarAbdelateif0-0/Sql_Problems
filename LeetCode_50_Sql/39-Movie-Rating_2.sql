-- solution 2

WITH UserCounts AS (
    SELECT 
        user_id, 
        COUNT(user_id) AS num_user
    FROM 
        MovieRating
    GROUP BY 
        user_id
),
max_rate_user as (
    select 
        top(1) U.name 
    from 
        UserCounts mr 
    join 
        Users U
    on 
        mr.user_id = U.user_id
    and
        mr.num_user =   (
                            select max(num_user)
                            from UserCounts 
                        )
    order by 
        U.name
),
feb_rate as(
    select  
        movie_id,
        avg(rating * 1.0) as avg_rating
    from 
        MovieRating 
    where 
        month(created_at) = 2 
    and 
        year(created_at) = 2020
    group by 
        movie_id
),

max_rate_movie as (
    select 
        top(1) M.title
    from
        Movies M
    join
        feb_rate fr
    on
        fr.movie_id = M.movie_id
    where
        fr.avg_rating = (
                            select max(avg_rating)
                            from feb_rate
                        )
    order by
        M.title

)

select 
    name as results
from 
    max_rate_user
union all 
select 
    title 
from 
    max_rate_movie