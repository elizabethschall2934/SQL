--1. List the following details of each employee: employee number, last name,
--first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 
--1986.

SELECT employees.first_name, employees.last_name,  employees.hire_date
FROM employees
WHERE employees.hire_date BETWEEN '01/01/86' AND '12/31/86';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name.

SELECT departments.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN titles ON employees.emp_title_id = titles.title_id
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE titles.title = 'Manager';


--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name  
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no;

--5. List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' 
AND employees.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number,
--last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' OR dept_name ='Development';

--8. In descending order, list the frequency count of employee last names, i.e.,
--how many employees share each last name. Results seem interesting and thought I did something wrong
--but I did a pivot table on the file and got the same results

SELECT last_name, COUNT (*)
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;