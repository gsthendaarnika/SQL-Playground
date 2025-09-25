/*============================================================
   SQL PRACTICE NOTES – DAY 3 (LOGICAL OPERATORS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */

-- Q1. Retrieve employees in 'Sales' department AND salary > 50000
select * from employees3 where department='Sales' and salary>50000;
-- AND → Both conditions must be TRUE

-- Q2. Retrieve employees in 'Sales' department OR salary > 50000
select * from employees3 where department='Sales' or salary>50000;
-- OR → At least one condition must be TRUE

-- Q3. Retrieve employees NOT in 'HR' department
select * from employees3 where not department='HR';
-- NOT → Reverses the condition (TRUE → FALSE, FALSE → TRUE)

-- Q4. Combine multiple conditions using AND, OR, NOT
select * from employees3 where (department='Sales' or department='Marketing') and salary>40000;
-- Use parentheses to control the order of evaluation

-- Q5. Check if a value is within a set using IN
select * from employees3 where department in ('Sales','HR','IT');
-- IN → Checks if value matches any value in the list

-- Q6. Check if a value is NOT within a set using NOT IN
select * from employees3 where department not in ('Finance','Admin');
-- NOT IN → Excludes values in the list

-- Q7. Check a range of values using BETWEEN
select * from employees3 where salary between 30000 and 60000;
-- BETWEEN x AND y → Checks if value is >= x and <= y

-- Q8. Check a value not in a range using NOT BETWEEN
select * from employees3 where salary not between 30000 and 60000;
-- NOT BETWEEN x AND y → Excludes values in the range

-- Q9. Check for pattern matching using LIKE
select * from employees3 where name like 'A%';
-- LIKE → Matches pattern, % = any number of characters, _ = single character

-- Q10. Check if a column has NULL values
select * from employees3 where department is null;
-- IS NULL → Checks if value is NULL

-- Q11. Check if a column is NOT NULL
select * from employees3 where department is not null;
-- IS NOT NULL → Checks if value is NOT NULL
