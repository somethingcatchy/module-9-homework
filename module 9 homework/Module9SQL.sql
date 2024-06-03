drop table dept_manager


Create table departments (

	dept_no varchar,
	dept_name varchar);
	
Create table dept_emp (
	emp_no INT,
	dept_no varchar);
	
Create table dept_manager (
	dept_no varchar,
	emp_no INT);
	
Create table employees (
	emp_no INT,
	emp_title varchar,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex char,
	hire_date date);
	
Create table salaries (
	emp_no INT,
	salary INT);
	
Create table titles (
	title_id varchar,
	title varchar);
	
	
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
INNER JOIN Salaries s ON e.emp_no = s.emp_no

SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


	
SELECT 
    e.emp_no,
	d.dept_no,
    d.dept_name,
    e.last_name,
    e.first_name
FROM 
    dept_manager m
INNER JOIN 
    Employees e ON m.emp_no = e.emp_no
INNER JOIN
	departments d ON m.dept_no = d.dept_no;
	
	

SELECT 
    d.dept_no,
	d.dept_name,
	e.emp_no,
    e.last_name,
    e.first_name
    
FROM 
    Employees e
INNER JOIN
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN
    Departments d ON de.dept_no = d.dept_no;
	
	

SELECT 
    first_name, 
    last_name, 
    sex
FROM 
    Employees
WHERE 
    first_name = 'Hercules' 
    AND 
    last_name LIKE 'B%';
	
	
	
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    Employees e
INNER JOIN 
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN 
    Departments d ON d.dept_name = d.dept_name
WHERE 
    d.dept_name = 'Sales';
	
	

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    Employees e
INNER JOIN 
    dept_emp de ON e.emp_no = de.emp_no
INNER JOIN 
    Departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');
	
	
	
SELECT 
    last_name,
    COUNT(*) AS frequency
FROM 
    Employees
GROUP BY 
    last_name
ORDER BY 
    frequency DESC;