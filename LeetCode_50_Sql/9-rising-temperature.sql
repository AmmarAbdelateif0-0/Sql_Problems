select 
    w.id
from
    Weather w
join
    Weather w2
on 
    w.recordDate = DATE_ADD(w2.recordDate, interval 1 Day)
where 
    w.temperature > w2.temperature
