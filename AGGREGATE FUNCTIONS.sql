/*============================================================
   SQL PRACTICE NOTES – DAY 2 (AGGREGATE FUNCTIONS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */

use daarnika;

#DATA TABLE PRACTICE (Aggregate Functions)
select * from data;

-- Q1. Retrieve the total sales for each category
select sum(total) from data group by category;

-- Q2. Retrieve the minimum quantity for each location
select min(quantity) from data group by location;

-- Q3. Retrieve the average sales for each category
select avg(total) from data group by category;

-- Q4. Retrieve the total sales for each category where the quantity is greater than 1
select sum(total) from data where quantity > 1 group by category;

-- Q5. Retrieve the minimum quantity for each location where sales are above 300
select min(quantity) from data where total > 300 group by location;

-- Q6. Retrieve the total quantity for each location where sales are between 300 and 500
select sum(quantity) from data where total between 300 and 500 group by location;

-- Q7. Retrieve the total sales for each location where total sales exceed 1200
select sum(total), location from data group by location having sum(total) > 1200;

-- Q8. Retrieve the total sales for each location where the total sales exceed 200
select sum(total), location from data group by location having sum(total) > 200;

-- Q9. Retrieve the total quantity for each category where unit price is less than 500
select sum(quantity) from data where unitprice < 500 group by category;

-- Q10. Retrieve the total unit price for each location
select sum(unitprice) from data group by location;

-- Q11. Retrieve the total sales for each location only for the Furniture category
select sum(total) from data where category = "Furniture" group by location;

-- Q12. Retrieve the total quantity for each category where unit price is above 150 and total quantity > 10
select sum(quantity) from data where unitprice > 150 group by category having sum(quantity) > 10;

-- Q13. Retrieve the total sales for each category, but only for the location 'Tokyo'
select sum(total) from data where location = "Tokyo" group by category;

-- Q14. Retrieve the total sales for each location where quantity > 1 and unit price > 100
select sum(total) from data where quantity > 1 and unitprice > 100 group by location;

-- Q15. Retrieve the total number of sales records for each category
select category, count(*) from data group by category;
-- COUNT(*) → Counts all rows in the group

-- Q16. Count the number of records where sales > 300 for each location
select location, count(*) from data where total > 300 group by location;

-- Q17. Count distinct categories in the table
select count(distinct category) from data;
-- COUNT(DISTINCT column) → Counts unique values only

#EMPLOYEE TABLE PRACTICE (Aggregate Functions)
select * from employee;

-- Q18. Retrieve the total salary paid for each role
select sum(salary) from employee group by role;

-- Q19. Retrieve the maximum salary for each location where employee age is above 25
select max(salary) from employee where age > 25 group by location;

-- Q20. Retrieve both the total salary and the maximum salary across all records
select sum(salary), max(salary) from employee;

-- Q21. Retrieve the maximum salary for employees with the role 'Data Analyst'
select max(salary) from employee where role = "Data Analyst" group by role;

-- Q22. Retrieve the maximum salary for each location where employee age > 30 and total salary exceeds 150000
select max(salary), sum(salary) from employee where age > 30 group by location having sum(salary) > 150000;

-- Q23. Retrieve the maximum salary for each location where the role starts with 'HR'
select max(salary) from employee where role like "HR%" group by location;

-- Q24. Retrieve the number of employees in each location
select location, count(*) from employee group by location;

-- Q25. Retrieve the number of employees in each role
select role, count(*) from employee group by role;

-- Q26. Count distinct roles in the employee table
select count(distinct role) from employee;
