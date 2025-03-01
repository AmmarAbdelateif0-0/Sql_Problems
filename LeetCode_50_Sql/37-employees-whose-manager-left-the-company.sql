Select employee_id 
from Employees 
where manager_id IS NOT NULL
  AND manager_id NOT IN (
      SELECT employee_id
      FROM Employees
  )
  and salary < 30000
  order by employee_id