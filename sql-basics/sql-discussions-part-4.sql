-- String concatenation - joining two or more strings together
-- we can use the concat function to join 2 strings
select concat('sarthak ', 'likes ', 'databases') from dual; -- will print sarthaklikesdatabases.

-- if you want space in between 2 strings, then you need to explicitly concat a space
select concat(first_name, ' ', last_name, ' - live long and prosper') from employees;

-- IMPORTANT -SQL joins
-- What are JOINS in SQL? - A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
-- note that 2 tables need to have at least 1 common column between the two of them for them to be join-able
-- example let us select some job Information for employees from the jobs table.
-- we want to display their first name, last name, salary, their full job title and the min and max salaries they
-- are entitled to as a part of that job title.
select emp.first_name, emp.last_name, emp.salary, jb.job_title, jb.max_salary, jb.min_salary
  from employees emp
  join jobs jb on jb.job_id = emp.job_id; -- there can be more than 1 common column between 2 tables and you can join on them.

-- let us join one more table and provide some column aliases too.
-- this is important because this shows how can we combine information from more than one table to produce meaningful
-- results.
-- remember - basic SQL syntax still remains the same
select concat(emp.first_name, ' ', emp.last_name) employee_full_name, dept.department_name, jb.job_title, emp.salary
  from employees emp
  join jobs jb on jb.job_id = emp.job_id
  join departments dept on dept.department_id = emp.department_id
where emp.salary > 12000 or emp.commission_pct > 0.1;


-- please practice a little more using these join statements and get comfortable with them.