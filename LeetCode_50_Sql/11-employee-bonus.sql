select 
    name,
    bonus
from 
    Employee E 
left join
    Bonus B
on 
    E.empId = B.empId
where
    B.bonus is null
or
    B.bonus < 1000
