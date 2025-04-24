select 
    M.name
from 
    Employee E
join
    Employee M
on 
    E.managerId = M.id  
group by 
    M.id , M.name
having
    (count(E.id)) >=5


