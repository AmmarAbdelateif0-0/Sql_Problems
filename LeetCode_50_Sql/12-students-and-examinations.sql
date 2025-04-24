select 
    S.student_id,
    S.student_name,
    sub.subject_name,
    count(E.student_id) as attended_exams
from  
    Students S
cross join 
    Subjects sub
left join
    Examinations E
on 
    E.student_id = S.student_id
AND
    sub.subject_name = E.subject_name
group by
    S.student_id,
    S.student_name,
    sub.subject_name
order by 
    S.student_id, subject_name

