-- sorting columns based on values. ascending and descending
-- you can arrange and sort rows based on the values of a column using the order by clause.

-- sorting means arranging values in the order of smallest to largest or largest to smallest based on the type of sorting.
-- sorting from largest to smallest is called descending order sort and sorting from smallest to largest value is ascending order sort.

-- SQL gives us 2 keywords to sort ascending and descending - asc and desc
-- default sort order in SQL is ascending.

-- e.g. let us sort the employees based on the people who were hired in ascending order  which means people who have been
-- with the company with the longest time will be first (as older date is less than newer date)
select * from employees order by hire_date; -- remember default order is ascending

-- if you want to order by people who joined last you can sort descending using desc keyword after the column name like below
select * from employees order by hire_date desc;
-- another example of sort descending
select * from employees order by salary desc;

-- you can sort on more than one column
select * from employees order by hire_date, salary;

-- you can sort differently on multiple columns by writing specific ascending or descending fashion
-- below query will sort hire date by ascending(oldest employees first) and then if 2 or more people have the same hire_date, it will sort those
-- people in descending order based on their salary
select * from employees order by hire_date asc, salary desc;

-- information in a database can be thought of as being organized in 3 levels
-- first level - schema. think of it as a container for all your tables.
-- hr is an example. to access a table in a schema you just do <schema name>.<table name>
select * from hr.employees;
-- second level - tables
select * from employees;
-- third level - columns
select hr.employees.first_name, hr.employees.last_name from hr.employees;

-- to visualise this, think of schemas as packages in JAVA, tables as classes in JAVA and columns are class member variables.
-- each row is then an object where the values of the object are stored inside the columns

-- aliases in SQL
-- alias - another name for something

-- example - table alias
select emp.first_name from hr.employees emp;
select cont.* from countries cont;
select emp.* from employees;


-- meta data ? data about data
-- In SQL context = tables store our data e.g. employees table stores information about the employees
-- there are special tables provided by the database itself which provide information about our tables and columns in those tables.
-- these special tables exist in a special schema in MySQL called as information_schema
-- we will discuss 2 special tables - tables and columns

-- example - let us see all the tables that we have in our hr schema
select * from information_schema.tables where table_schema = 'hr';

-- example - let us see all the columns our tables in our hr schema
select * from information_schema.columns where table_schema = 'hr' and table_name = 'employees';
