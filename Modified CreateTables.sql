-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yNK4oB
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE Employee_Data (
    emp_no int   NOT NULL,
    emp_title_id varchar   NOT NULL,
    birth_date varchar(10)   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar(1)   NOT NULL,
    hire_date varchar(10)   NOT NULL,
    CONSTRAINT pk_Employee_Data PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Employee_Depts (
    emp_no int   NOT NULL,
    dept_no varchar(4)   NOT NULL,
     )
);

CREATE TABLE Data_Depts (
    dept_no varchar(4)   NOT NULL,
    dept_name varchar   NOT NULL,
    CONSTRAINT pk_Data_Depts PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Manager_Depts (
    emp_no int   NOT NULL,
    dept_no varchar(4)   NOT NULL,
    CONSTRAINT pk_Manager_Depts PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salary_Data (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    CONSTRAINT pk_Salary_Data PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Title_Data (
    title_id varchar(5)   NOT NULL,
    title varchar   NOT NULL,
    CONSTRAINT pk_Title_Data PRIMARY KEY (
        title
     )
);

ALTER TABLE Employee_Depts ADD CONSTRAINT fk_Employee_Depts_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee_Data (emp_no);

ALTER TABLE Employee_Depts ADD CONSTRAINT fk_Employee_Depts_dept_no FOREIGN KEY(dept_no)
REFERENCES Data_Depts (dept_no);

ALTER TABLE Manager_Depts ADD CONSTRAINT fk_Manager_Depts_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee_Data (emp_no);

ALTER TABLE Manager_Depts ADD CONSTRAINT fk_Manager_Depts_dept_no FOREIGN KEY(dept_no)
REFERENCES Data_Depts (dept_no);

ALTER TABLE Employee_Data ADD CONSTRAINT fk_Employee_Data_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Title_Data (title_id);

ALTER TABLE Salary_Data ADD CONSTRAINT fk_Salary_Data_emp_no FOREIGN KEY(emp_no)
REFERENCES Employee_Data (emp_no);