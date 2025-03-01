with consecutively as(
    select 
        num,
        lead(num,1) OVER (ORDER BY id) as next_element ,
        lead(num,2) OVER (ORDER BY id) as next_next_element
    from
        Logs     
)
select 
    distinct num as ConsecutiveNums 
from 
    consecutively
where
    num = next_element
and
    num = next_next_element
