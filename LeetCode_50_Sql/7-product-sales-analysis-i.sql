select product_name  , year , price 
from Sales S INNER JOIN Product P
on S.product_id=P.product_id 