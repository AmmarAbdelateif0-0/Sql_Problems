WITH FirstLogin AS (
    select 
        player_id,
        MIN(event_date) as first_login
    from
        Activity 
    group by 
        player_id
),
next_login as(
    select 
        DISTINCT a.player_id
    from 
        Activity a
    join
        FirstLogin f
    on 
        a.player_id = f.player_id
    and 
        a.event_date = DATEADD (day , 1 ,f.first_login)
)
select 
    round( count(distinct n.player_id) * 1.0 / count(distinct f.player_id),2) as fraction 
from
    FirstLogin f
left join
    next_login n
on 
    f.player_id = n.player_id