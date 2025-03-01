SELECT unique_id , name
from Employees E left outer join  EmployeeUNI EU
on E.id = EU.id