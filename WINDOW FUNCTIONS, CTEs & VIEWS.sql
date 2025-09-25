/*============================================================
   SQL PRACTICE NOTES – DAY 6 (WINDOW FUNCTIONS, CTEs & VIEWS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */
use daarnika;

---------------- EMPLOYEES3 TABLE ----------------
select * from employees3;

-- 1️. WINDOW FUNCTIONS (Ranking & Analytical Functions)

-- Using RANK(): Assigns rank with gaps if ties
select name, salary, rank() over(order by salary desc) as ranked from employees3;

-- Using DENSE_RANK(): Assigns rank without gaps for ties
select name, salary, dense_rank() over(order by salary desc) as dense_ranked from employees3;

-- Using ROW_NUMBER(): Unique row number even if salary ties
select name, salary, row_number() over(order by salary desc) as row_numbered from employees3;

-- Ranking within groups (Partition by department)
select name, salary, department, rank() over(partition by department order by salary desc) as ranked from employees3;



-- 2️. LEAD & LAG FUNCTIONS (Compare rows within a group)
CREATE TABLE employees (
    Name VARCHAR(50),
    Date DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO employees (Name, Date, Salary) VALUES
('Selva', '2023-01-01', 5000.00),
('Selva', '2023-02-01', 5500.00),
('Selva', '2023-03-01', 6000.00),
('Mani',  '2023-01-01', 4000.00),
('Mani',  '2023-02-01', 4500.00),
('Mani',  '2023-03-01', 5000.00),
('Aravind','2023-01-01', 6000.00),
('Aravind','2023-02-01', 6500.00),
('Aravind','2023-03-01', 7000.00);

-- LEAD(): Returns next row value
select name, date, salary, lead(salary) over(partition by name order by date desc) as next_salary from employees;

-- LAG(): Returns previous row value
select name, date, salary, lag(salary) over(partition by name order by date desc) as previous_salary from employees;



---------------- CTE – COMMON TABLE EXPRESSIONS (Temporary Table using WITH) ----------------

-- Find the second highest salary using RANK()
with daarnika as (select name, salary, rank() over(order by salary desc) as ranked from employees3)
select * from daarnika where ranked = 2;

-- Find the third highest salary using DENSE_RANK()
with daarnika as (select name, salary, dense_rank() over(order by salary desc) as dense_rankedfrom employees3)
select * from daarnika where dense_ranked = 3;



---------------- VIEWS – PERMANENT TABLES ----------------

-- Simple view from DATA table
create view data1 as (select c_name, quantity, total from data);
select * from data1;

-- Complex view joining STUDENT & COURSE tables
create view data3 as (select s.name, s.age, s.fees, c.trainer from student s inner join course c on s.course_id = c.course_id);
select * from data3;

-- ✅ IMPORTANT POINTS:
-- 1. Window functions do not reduce rows; they add analytical info per row.  
-- 2. LEAD/LAG help compare current row with next/previous rows (useful in trend analysis).  
-- 3. CTEs improve readability for complex queries; can be chained or recursive.  
-- 4. Views act as saved queries; can be simple or complex joins, useful for repeated reports.
