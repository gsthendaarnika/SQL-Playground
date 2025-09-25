/*============================================================
   SQL PRACTICE NOTES – DAY 2 (IMPORTANT NUMERIC FUNCTIONS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */

-- Q1. Absolute value (remove negatives)
select name, abs(salary) as absolute_salary from employees3;
-- ABS(x) → Returns positive value

-- Q2. Round salary to nearest integer
select name, round(salary) as rounded_salary from employees3;
-- ROUND(x) → Rounds to nearest integer

-- Q3. Round salary to 2 decimal places
select name, round(salary,2) as rounded_2_decimal from employees3;
-- ROUND(x, d) → Rounds number to d decimals

-- Q4. Get only integer part (round down)
select name, floor(salary) as floor_salary from employees3;
-- FLOOR(x) → Largest integer ≤ x

-- Q5. Get next highest integer
select name, ceil(salary) as ceil_salary from employees3;
-- CEIL(x) → Smallest integer ≥ x

-- Q6. Remainder of salary divided by 5
select name, mod(salary,5) as remainder from employees3;
-- MOD(x, y) → Returns remainder of x/y

-- Q7. Generate random number
select rand() as random_number;
-- RAND() → Random float between 0 and 1
