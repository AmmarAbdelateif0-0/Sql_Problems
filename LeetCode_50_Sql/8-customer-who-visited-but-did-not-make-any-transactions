select
    customer_id ,
    COUNT(V.visit_id) as count_no_trans
from
    Visits V
left join
    Transactions T
on  
    V.visit_id = T.visit_id
where 
    transaction_id is NULL
group by 
    customer_id
