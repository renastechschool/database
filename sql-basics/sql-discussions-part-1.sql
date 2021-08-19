-- What is a database - In simpler terms, database is a system which stores information. This information can be retrieved, changed, deleted and more information added.
-- Are there type of databases -  yes, there are many types of databases. The one we are studying is called a relational database.


/*
What is a relational database?
A relational database is a type of database that stores and provides access to data that might be related to one another.
Relational databases are based on the relational model, an intuitive, straightforward way of representing data in tables.
In a relational database, each row in the table is a record with a unique ID called the key.
The columns of the table hold attributes of the data, and each record usually has a value for each attribute, making it easy to establish the relationships among data.

e.g. a simple model can be considered that of a HR system which stores
1. employee information
2. company information
3. department information
4. operational data

Each of the points above can be represented by a table. Each row in a table would be information about one of these things.
All the items in the HR model above is related to one another. A company has departments, a company also has employees and they work for various departments.
*/

/*
relational databases have their own language in which we can ask them to do things. this language is called SQL
SQL - Structure Query Language
*/

-- To fetch information from a database table is called as querying the database. SELECT statement helps us there

-- select statement syntax
-- select column 1, column 2, column 3 from <table_name> where <rows meet conditions>

-- Just like in JAVA database columns also have a specific data type.
-- Numeric values in DB can store any of the below types
-- int
-- double
-- float
-- short
-- long

-- examples of numbers in SQL
-- 567334.234
-- 123.1
-- 123.3456
-- 99999.999123
-- -99999999

-- numeric columns can store decimals or integers based on their scale and precision
-- precision tells the column what are the maximum number digits allowed in the column. e.g. NUMBER(precision=8) will allow any number where the number of digits is less than
-- or equal to 8
-- scale tells the column how many digits out of the total digits can be used for fractional purposes. Note, that scale is substracted from precision i.e. e.g. NUMBER(precision=8,scale=3)
-- will allow a number with max 8 digits. but out of those 8 digits max 3 digits can be after the decimal point. therefore, only 5 digits will be allowed in the integer part.
-- valid numbers that can be store in this column could be e.g. 1234.55 (total 6 digits) or 123123.12 (total 8 digits 6 integer part 2 decimal) or 12312312 (total 8 digits)


-- Strings in SQL can be of 2 types
-- VARCHAR
-- CHAR
-- you can learn more about both of those types more in detail here - https://dev.mysql.com/doc/refman/8.0/en/char.html

-- Columns in SQL can also be of type date which stores date information. note that although it looks like it stores a string, it does not. it is a custom format.

-- ================================================================================================================================================

-- select all columns from the table employees
select * from employees;


-- e.g. select 1 column from the table employees
select first_name from employees;
select email from employees;


-- select more than 1 columns from the table employees
select first_name, last_name from employees;
select email, first_name, last_name from employees;
select department_id, email, first_name, salary, last_name from employees;


-- filter data using the 'where' clause.
select * from employees where salary > 12000;

-- filtering results using different kinds of comparison operators.
-- (> < >= <= == !=)

-- example of less than
select * from employees where salary < 12000;

-- example of less than or equal to 
select * from employees where salary <= 12000;

-- example of equality
select * from employees where salary = 12000;

-- example of non-equality
select * from employees where salary <> 12000;
select * from employees where first_name != 1234;
select * from employees where first_name != 'Lex';

-- we can also filter on more than one column using the 'and'/ 'or' conditions
select email, first_name, last_name from employees where salary > 5000 and commission_pct < 1.0;


-- even database can have null values like JAVA. How do you check if a column value is null? we use the is null or is not null conditions
-- composite condition with check for null
select * 
  from employees
where salary > 10000 
  and commission_pct is null;

-- composite condition with and or and is null or not null
select first_name, last_name
  from employees
 where salary > 5000
   and (salary < 8000 or commission_pct > 0.35)
   and commission_pct is not null;
