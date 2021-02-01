--DROP TABLE employees CASCADE
--DROP TABLE IF EXISTS employees;
--DROP TYPE sex
CREATE TYPE sex AS ENUM ('M','F');
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL, 
 	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex sex NOT NULL,
	hire_date DATE NOT NULL
);

SELECT * from employees;

DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries (
	emp_no int NOT NULL,
	salary MONEY NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

SELECT * from salaries;

DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
);

SELECT * from titles;

DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

SELECT * from departments;

DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no VARCHAR(30) NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * from dept_emp;

DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager (
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

SELECT * from dept_manager;
