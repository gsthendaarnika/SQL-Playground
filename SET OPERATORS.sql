/*============================================================
   SQL PRACTICE NOTES – DAY 3 (SET OPERATORS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */

-- Create sample tables
create table first(name char(10) not null, age int not null, salary int);
create table second(name char(10) not null, age int not null, salary int);
create table three(name char(10) not null, age int not null, salary int);

-- Insert sample data
insert into first values("Selva",26,23000),("Thowfeek",23,20000),("Janaki",24,24000);
insert into second values("Haroon",24,16000),("Vidhya",22,15000),("Selva",26,23000),("Baskar",28,45000);
insert into three values('Mani',22,17000),('Lavanya',23,18000),('Nitheesh',24,19000);

-- View table data
select * from first;
select * from second;
select * from three;

-- Q1. UNION → Combine results from two tables, removes duplicates
select salary from first union select salary from second;

-- Q2. UNION ALL → Combine results from two tables, keeps duplicates
select salary from first union all select salary from second;

-- Q3. INTERSECT → Returns only common rows between two tables
select name, salary from first intersect select name, salary from second;

-- Q4. EXCEPT (or MINUS in some databases) → Returns rows in first table not in second
select salary from first except select salary from second;
