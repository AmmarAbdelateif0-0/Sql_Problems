-- soultion 1
select 
    a.machine_id,
    ROUND(AVG(a2.timestamp - a.timestamp) , 3) as processing_time
from
    Activity a 
join
    Activity a2
on  
    a.machine_id = a2.machine_id
and
    a.process_id = a2.process_id
and
    a2.activity_type = 'end'
and
    a.activity_type = 'start'
group by 
    a.machine_id

-- solution 2
# Write your MySQL query statement below
select 
    machine_id,
    ROUND(AVG(end_time - start_time) , 3) as processing_time
from 
(
    SELECT
        machine_id , process_id,  
        MAX( case when activity_type = 'start' then timestamp END ) as start_time , 
        MAX( case when activity_type = 'end'   then timestamp END ) as end_time 
    from 
        Activity
    group by 
        machine_id , process_id
) as time
group by 
    machine_id
