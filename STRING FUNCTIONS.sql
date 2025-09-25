/*============================================================
   SQL PRACTICE NOTES – DAY 2 (STRING FUNCTIONS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */

-- Q1. Extract first 3 characters from employee name
select name, left(name,3) as first_three_letters from employees3;
-- LEFT(string, n) → Returns first n characters from the left

-- Q2. Extract last 3 characters from employee name
select name, right(name,3) as last_three_letters from employees3;
-- RIGHT(string, n) → Returns last n characters from the right

-- Q3. Retrieve only the first name (before first space)
select name, substring_index(name," ",1) as first_name from employees3;
-- SUBSTRING_INDEX(string, delimiter, count) → Splits string, count=1 means part before first space

-- Q4. Retrieve first two words from employee name
select name, substring_index(name," ",2) as first_two_words from employees3;
-- If count > 1, SUBSTRING_INDEX takes that many parts from start

-- Q5. Concatenate employee name and department
select name, department, concat(name, " ", department) as full_detail from employees3;
-- CONCAT(string1, string2, …) → Joins multiple strings together

-- Q6. Create a custom email ID using first name + last 3 letters
select name, concat(substring_index(name, " ",1), right(name,3),"@gmail.com") as custom_email from employees3;
-- Functions can be combined inside CONCAT for string manipulation

-- Q7. Replace domain in email addresses
select email, replace(email, "@example.com","@gmail.com") as updated_email from customers;
-- REPLACE(string, old, new) → Substitutes occurrences of old with new

-- Q8. Retrieve employees whose name starts with ‘a’
select name from employees3 where left(name,1)="a";
-- LEFT(name,1) checks first letter, LIKE 'a%' can also be used

