-- dual is a special table. think of it like a reflect table
-- dual has only 1 column and 1 row.
-- dual just reflects back what you select from it.
-- dual is a very good way to test values that might be based on an expression
select 1 + 1 from dual;
select 'hello to this database workshop!' from dual;

-- date type columns store date information

-- It is important to learn some date functions in SQL which will allow us to compare and format dates properly


-- now() - gives the current UTC time and date. note that this date time is the server date time not the local date time
select now() from dual;


-- date_format(date, format_string) - date_format function converts the given 'date' in to a string based on the format_string
-- the date can be formatted to anything using a format specifier.
-- a list of format specifiers can be found here - https://www.w3resource.com/mysql/date-and-time-functions/mysql-date_format-function.php
-- UTC date - Universally coodinated time (format)
-- GMT - (timezone)
-- why do we need date formats? different countries and regious store and show date differently
-- US : mm/dd/yyyy
-- europe: dd/mm/yyyy
-- 		  dd/Mon/yyyy (12-Jul-2021)
-- here are a few examples
select date_format(now(), '%d/%m/%Y')
from dual;
select date_format(now(), '%Y=%d=%M')
from dual;
select date_format(date('1995-02-06'), '%Y/%d/%m')
from dual;



-- Try problems yourself first. compare with solution below
-- problem 1: format date to include day of the week (Mon, Tue, Wed..) e.g.Tuesday 2021 -08 -17 < time >
-- problem 2 : format time in 12 hour format. there should be no date ( e.g. 11:45 AM or 4:52 PM)
-- problem 3: format the date time like e.g.24 August 2021 11 :56 AM = > 08 -24 - 21_11_56
-- problem 4 : format date as (Month full name)-(yy) (Day of the week) e.g. if the date is 24 August 202, the output should be (August)-(21) (Day of the week: 2)


-- problem 1 : solution
select date_format(now(), '%W %Y %m %d %T')
from dual;

-- problem 2: solution
select date_format(now(), '%r')
from dual;

-- problem 3: solution
select date_format(date('2021-08-24'), '%m-%d-%y')
from dual;

-- problem 4 : solution
select date_format(now(), '(%M)-(%y) (Day of the week: %w)')
from dual;


-- str_to_date(string, format_string) - this function converts strings to date if the string is a valid date.
-- you need to give the function 2 parameters. the first one is a valid date string, the second string is the format string describing what is the format you
-- have given your date string in
-- look at examples below
select str_to_date('24 August 2021', '%d %M %Y')
from dual;
select str_to_date('July-4-2001', '%M-%d-%Y')
from dual;
select str_to_date('July-4-2001 01:22 PM', '%M-%d-%Y %h:%i %p')
from dual;


-- here is a slightly complicated example which first converts a string in our format to a date, and then converts it another format altogether
select date_format(
        str_to_date('24 August 2021', '%d %M %Y'),
        '%m-%d-%y'
    )
from dual;


-- datediff(date1, date2) - gives the difference in days between the 2 dates

select datediff(date(now()), date('2021-05-10'))
from dual;

-- how can we use this in a real example? take a look. We are checking here if there are employees who have been with the company for more than 12000 days.
select *
from employees
where datediff(now(), hire_date) > 12000;
