-- types of joins - left, right and inner join

-- let us take 2 tables as sample
select * from A;
select * from B;

-- example of a normal join or also called as an inner join. inner keyword before join in this case is optional.
select *
  from A
 inner join B on A.id = B.id;

-- example of a right join. in this case all rows from RHS table will be selected and rows which do not match with the LHS table
-- will be selected as null on the LHS table row values
 select *
  from A
 right join B on A.id = B.id;
 
-- example of a left join. in this case all rows from LHS table will be selected and rows which do not match with the RHS table
-- will be selected as null on the RHS table row values
 select *
   from A
   left join B on A.id = B.id;