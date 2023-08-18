-- list of Employee names, sex, and salaries
select e.first_name, e.last_name, e.sex, s.salary
from employees e
join salaries s
on e.emp_no = s.emp_no;

-- list of Employees names,hire dates for employees hired 1986
select first_name, last_name, hire_date
from employees
where hire_date between '1/1/1986' and '12/31/1986';

-- list of Managers names, employee number, department number and name
select e.first_name, e.last_name, e.emp_no, dept_man.dept_no, dept.dept_name
from employees e
inner join dept_manager dept_man
on e.emp_no = dept_man.emp_no
join departments dept
on dept_man.dept_no = dept.dept_no;

-- list of employees names, employees number, department number and name
select e.first_name, e.last_name, e.emp_no, dept_emp.dept_no, dept.dept_name
from employees e
join dept_emp
on e.emp_no = dept_emp.emp_no
join departments dept
on dept_emp.dept_no = dept.dept_no;

-- Listing of first name, last name, and sex of each employee whose last name begins with the letter B and first name is Hercules  
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%' ;

-- Listing of each employee in the Sales department, has info such as their employee number, first name, and last name
select first_name, last_name, emp_no
from employees 
where emp_no IN (
    select emp_no
    from dept_emp
    where dept_no IN (
        select dept_no
        from departments
        where dept_name = 'Sales'
    )
);

-- listing of employees in the Sales and Development departments, has info such as their employee number, first name, last name, and department name.
select e.first_name, e.last_name, e.emp_no, departments.dept_name
from employees e
join dept_emp
on e.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

-- Lists of the frequency counts in descending order of all the employee last names
select last_name, count(last_name) as "last_name_frequency"
from employees
group by last_name
order by "last_name_frequency" desc;