--List the employee number, last name, first name, sex, and salary of each employee 
select emp_no as employee_number,
last_name, 
first_name, 
sex, 
salary
from employee e join salaries s using(emp_no);


--List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date from employee 
where extract(year from hire_date) = 1986 ;

--List the manager of each department along with their department number, department name, employee number, last name, and first name 
select dept_no, dept_name, emp_no, last_name, first_name
from employee e join dept_manager m using(emp_no) 
join departments d  using(dept_no);

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select emp_no, last_name, first_name, dept_name
from employee join dept_emp using(emp_no) join departments using(dept_no);

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select first_name, last_name, sex
from employee
where first_name like 'Hercules' and last_name like 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name
select emp_no, last_name, first_name
from employee join dept_emp using(emp_no) join departments using(dept_no)
where dept_name like 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select emp_no, last_name, first_name, dept_name
from employee join dept_emp using(emp_no) join departments using(dept_no)
where dept_name like 'Sales' or dept_name like 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
select last_name, count(last_name) 
from employee group by 1 order by 2 desc;