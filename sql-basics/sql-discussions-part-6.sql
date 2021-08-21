-- important SQL functions and clauses
-- take an example query
select * from employees where job_id = 'SA_MAN' or job_id = 'SA_REP' or job_id = 'FI_MGR';

-- this query can also be written using the SQL in clause
-- in clause : example with string
select * from employees where job_id in ('SA_REP', 'SA_MAN', 'FI_MGR');

-- in clause : example with numbers
select * from employees where department_id in (100, 80);

-- not in clause
select * from employees where department_id not in (100, 80);

-- like clause: check if a string matches a pattern. % is called the wild card characted in SQL

-- select every employee whose last_name starts with k
select * from employees where last_name like 'k%';
-- select every employee whose last_name ends with k
select * from employees where last_name like '%k';
-- select every employee whose last_name contains k
select * from employees where last_name like '%k%';
-- select every employee whose last_name does not contain k
select * from employees where last_name not like '%k%';
-- select every employee whose last_name contains k but ends with an r
select * from employees where last_name like '%k%r';
-- select every employee whose last_name starts with k but contains a
select * from employees where last_name like 'k%a%';

-- length(string) : gives you the length of a string
select * from employees where length(last_name) < 5;
select length('sarthak') from dual;

-- ltrim(string), rtrim(string) and trim(string)
select '  sarthak   ' from dual;
select ltrim('  sart    hak  tic koo  ') from dual;
select rtrim('  sarthak  tickoo  ') from dual;
select trim('  sarthak  tickoo  ') from dual;



-- lower(string) and upper(string) functions : convert strings to and from lower and upper case respectively
select 'SarThak' from dual;
select lower('SarThak') from dual;
select upper('SarThak') from dual;

-- example with upper
select upper(last_name) from employees where upper(last_name) like 'K%A%';

-- reverse function - reverse a string
select reverse(last_name) from employees;


-- sub-queries
select *
  from departments
 where location_id in 
  (
     select location_id from locations where country_id = 'US'
     -- equivalent to writing 1400, 1500, 1600, 1700
  );

select d.*
  from departments d
  join locations l on d.location_id = l.location_id
 where l.country_id = 'US';
 

-- dummy column : it is a column which can be defined by by the user as a part of the SQL query itself.
-- the column in nothing but a visual represenation in the format that you would like to see things in.
-- it sometimes helps add additional information to the result set
-- you can add a column alias to this dummy column for it to make more sense
select 1 as dummy_col, e.* from employees e;


-- case when then in SQL is equivalent to switch case in JAVA
-- JAVA switch(value)
-- case valu1
-- case valu2
-- default
-- where can we use it? let us take an example : we want to check if the employee earns more than 10000 a month
-- if you had to this in JAVA you would write for (rows) check if row.salary > 10000
-- however in SQL you can do this much more efficiently and in a better way
-- using the case when then structure and selecting some values in the dummy column
-- see an example below

select employee_id, concat(first_name, ' ', last_name),salary,
  case
	 when salary > 12000 and commission_pct > 0.35 then 'earns more than 12k'
     when salary > 10000 then 'earns more than 10k'
     else 'earns something else'
  end as 'salary_info'
 from employees;


-- distinct clause : select unique values from a column. duplicates will be skipped and only one of those values will be selected.
select distinct location_id from departments where department_name in ('Benefits', 'Finance', 'Sales');


-- union and union all
-- union just concatenates the result set of 2 SQL queries. union always selects distinct values
select location_id from departments where department_name in ('Benefits', 'Finance', 'Sales')
union
select location_id from locations where country_id = 'CA';

-- union selects distinct values and union all selects duplicate values
select location_id from departments where department_name in ('Benefits', 'Finance', 'Sales')
union all
select location_id from locations where country_id = 'CA';


-- group by : it is a way to categorize data and then run some analytic/ aggregate functions on this data set
-- to get some form of statistics
-- examples of aggergate functions : max min sum avg count

-- example group by - select a job_id and count the number of employees in a certain group.
select job_id, count(employee_id)
  from employees
 group by job_id;


-- example group by - select a job_id and find the average salary of employees in a certain group.
select job_id, avg(salary)
  from employees
 group by job_id;

-- example group by - select a department name, location ID and then find the average salary for a certain group in a location
-- then sort this data by average salary in ascending order.
select d.department_name, d.location_id, avg(e.salary) avg_sal
  from employees e
  join departments d on e.department_id = d.department_id
 group by d.department_name, d.location_id
 order by avg_sal;