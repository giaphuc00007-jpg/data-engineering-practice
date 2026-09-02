-- Difficulty: Medium
-- Description: As part of an ongoing analysis of salary distribution within the company, your manager has requested a report identifying high earners in each department. A 'high earner' within a department is defined as an employee with a salary ranking among the top three salaries within that department.

--You're tasked with identifying these high earners across all departments. Write a query to display the employee's name along with their department name and salary. In case of duplicates, sort the results of department name in ascending order, then by salary in descending order. If multiple employees have the same salary, then order them alphabetically.

--Note: Ensure to utilize the appropriate ranking window function to handle duplicate salaries effectively..

with dk as(
SELECT  department_name,name,salary,
DENSE_RANK() over(
PARTITION by department.department_name
order by salary desc
) as ranking

FROM employee
left join department
on department.department_id	=employee.department_id	
)
select department_name,name,salary
from dk
where ranking <= 3
order by 
department_name ASC,
  salary DESC,
  name ASC;
;
