--Homework queries

--1. List the following details of each employee:
--   employee number, last name, first name, sex, and salary.
select employee_data.emp_no,
	employee_data.last_name,
	employee_data.first_name,
	employee_data.sex,
	salary_data.salary
From salary_data
Inner Join employee_data on
employee_data.emp_no=salary_data.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name,
		last_name,
		hire_date
from employee_data
	where hire_date between '1986-01-01' and '1986-12-31';

--3. List the manager of each department with the following information:
--   department number, department name, the manager's employee number, last name, first name.
select data_depts.dept_no,
	data_depts.dept_name,
	manager_depts.emp_no,
	employee_data.last_name,
	employee_data.first_name
from data_depts
Inner Join manager_depts on
data_depts.dept_no=manager_depts.dept_no
Inner Join employee_data on
employee_data.emp_no=manager_depts.emp_no;

--4. List the department of each employee with the following information: 
--   employee number, last name, first name, and department name.
select employee_data.emp_no,
	employee_data.last_name,
	employee_data.first_name,
	data_depts.dept_name
from data_depts
Inner Join employee_depts on
data_depts.dept_no=employee_depts.dept_no
Inner Join employee_data on
employee_data.emp_no=employee_depts.emp_no;

--5. List first name, last name, and sex for employees
--whose first name is "Hercules" and last names begin with "B."
select first_name,
last_name,
sex
from employee_data
where first_name = 'Hercules'
AND last_name like 'B%';

--6.List all employees in the Sales department,
-- including their employee number, last name, first name, and department name.
select employee_data.emp_no,
employee_data.last_name,
employee_data.first_name,
data_depts.dept_name
from data_depts
Inner Join employee_depts on
data_depts.dept_no=employee_depts.dept_no
Inner Join employee_data on
employee_data.emp_no=employee_depts.emp_no
where dept_name = 'Sales';

--7.List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name. 
select employee_data.emp_no,
employee_data.last_name,
employee_data.first_name,
data_depts.dept_name
from data_depts
Inner Join employee_depts on
data_depts.dept_no=employee_depts.dept_no
Inner Join employee_data on
employee_data.emp_no=employee_depts.emp_no
where dept_name = 'Sales' or dept_name = 'Development';

--8.In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
select last_name, count(last_name) from employee_data
group by last_name
order by count(last_name) desc;