WITH FirstLogin AS (
    select 
        player_id,
        event_date,
        dense_rank() over(
                            partition by 
                                player_id
                            order by
                                event_date 
                        ) as denseRank
    from
        Activity
)
select
    round( ( count(distinct a.player_id) * 1.0 ) / (select count(distinct player_id) from Activity),2) as fraction
from 
    FirstLogin a
join 
    FirstLogin b
on  
    a.player_id = b.player_id
and
    a.denseRank = 1
and
    b.denseRank = 2
and
    b.event_date = DATEADD(day,1,a.event_date)