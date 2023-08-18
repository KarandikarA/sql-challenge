 -- Create table for Departments
create table "departments" (
    "dept_no" VARCHAR(20)   not NULL,
    "dept_name" VARCHAR(30)   not NULL,
    primary key ("dept_no")
);

-- Create table for Titles  
create table "titles" (
    "title_id" varchar(20)   not NULL,
    "title" varchar(30)   not NULL,
    primary KEY ("title_id")
);

-- Create table for Employees  
create table "employees" (
    "emp_no" INT   not NULL,
    "emp_title_id" VARCHAR(20)   not NULL,
    "birth_date" DATE   not NULL,
    "first_name" VARCHAR(30)   not NULL,
    "last_name" VARCHAR(30)   not NULL,
    "sex" VARCHAR(10),
    "hire_date" DATE   not NULL,
    primary key ("emp_no"),
    foreign key("emp_title_id") references "titles" ("title_id")
);

-- Create table for Employee Departments  
create table "dept_emp" (
    "emp_no" INT   not NULL,
    "dept_no" VARCHAR(20)   not NULL,
    foreign key("emp_no") references "employees" ("emp_no"),
    foreign key("dept_no") references "departments" ("dept_no")
);

-- Create table for Managers' Departments Table
create table "dept_manager" (
    "dept_no" VARCHAR(20)   not NULL,
    "emp_no" INT   not NULL,
    foreign key("dept_no") references "departments" ("dept_no"),
    foreign key("emp_no") references "employees" ("emp_no")
);

-- Create table for Salaries  
create table "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    foreign key ("emp_no") references "employees" ("emp_no")
);

-- To add primary keys for tables with no primary keys added when creating
alter table dept_emp add primary key(emp_no,dept_no);
alter table dept_manager add primary key (emp_no);
alter table salaries add primary key (emp_no);
