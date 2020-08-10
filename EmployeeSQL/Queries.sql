CREATE TABLE employees_info AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries ON
employees.emp_no = salaries.emp_no;

SELECT * FROM employees_info

CREATE TABLE employees_hired_in_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31'
ORDER BY hire_date

SELECT * FROM employees_hired_in_1986

CREATE TABLE manager_of_each_department AS
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
  JOIN dept_manager
  ON departments.dept_no = dept_manager.dept_no
    JOIN employees
    ON employees.emp_no = dept_manager.emp_no
ORDER BY dept_no

SELECT * FROM manager_of_each_department

CREATE TABLE department_of_each_employee AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
	  JOIN departments
   ON departments.dept_no = dept_emp.dept_no
ORDER BY emp_no

SELECT * FROM department_of_each_employee

CREATE TABLE employees_name_criteria AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

SELECT * FROM employees_name_criteria

CREATE TABLE sales_department_employees AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments 
  JOIN dept_emp
  ON departments.dept_no = dept_emp.dept_no
    JOIN employees
    ON employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales'
ORDER BY emp_no

SELECT * FROM sales_department_employees

CREATE TABLE sales_and_development_department_employees AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments 
  JOIN dept_emp
  ON departments.dept_no = dept_emp.dept_no
    JOIN employees
    ON employees.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development'
ORDER BY emp_no

SELECT * FROM sales_and_development_department_employees

CREATE TABLE count_of_employees_per_last_name AS
SELECT last_name, COUNT(last_name) AS "number_of_employees"
FROM employees
GROUP BY last_name;

SELECT * FROM count_of_employees_per_last_name

Epilogue

CREATE TABLE Epilogue AS
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no = '499942'

SELECT * FROM Epilogue