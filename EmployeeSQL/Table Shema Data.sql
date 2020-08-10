DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL ,
    dept_name VARCHAR NOT NULL ,
    PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL ,
    dept_no VARCHAR NOT NULL ,
    PRIMARY KEY (
        emp_no , dept_no
    )
);

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL ,
	emp_no INTEGER NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE employees (
    emp_no INTEGER NOT NULL ,
    emp_title_id VARCHAR NOT NULL ,
    bith_data DATE NOT NULL ,
    first_name VARCHAR NOT NULL ,
    last_name VARCHAR NOT NULL ,
    sex Char(1) NOT NULL ,
    hire_date DATE NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE salaries (
    emp_no INTEGER NOT NULL ,
    salary INTEGER NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE titles (
    title_id VARCHAR NOT NULL ,
    title VARCHAR NOT NULL ,
    PRIMARY KEY (
        title_id
    )
);

ALTER TABLE dept_emp ADD CONSTRAINT FK_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT FK_dept_emp_emp_no_3 FOREIGN KEY(emp_no)
REFERENCES salaries (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT FK_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT FK_dept_manager_dept_no FOREIGN KEY(dept_no , emp_no)
REFERENCES dept_emp (dept_no , emp_no);

ALTER TABLE employees ADD CONSTRAINT FK_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);