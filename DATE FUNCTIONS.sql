/*============================================================
   SQL PRACTICE NOTES – DAY 2(DATE FUNCTIONS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */

select * from employee;

SELECT CURDATE();
SELECT curtime();

-- Q1. Determine the number of years each employee has been working
select name, timestampdiff(year, joining_date, curdate()) as number_of_years_worked from employee;

-- Q2. Calculate the number of days each employee has worked
select name, timestampdiff(month, joining_date, curdate()) as days_worked from employee;

-- Q3. Retrieve the details of employees who joined in the year 2021
select * from employee where year(joining_date)=2021;

-- Q4. Find employees who have been working for more than 4 years
select name, timestampdiff(year, joining_date, curdate()) as years_worked from employee having years_worked>4;

-- Q5. Retrieve the employees who joined in June 2021
select name from employee where year(joining_date)=2021 and month(joining_date)=6;

-- Q6. Find the total number of employees who joined in 2022
select count(name) from employee where year(joining_date)=2022;

-- Q7. Retrieve the number of employees who joined after September 2020
select count(employee_id) from employee where joining_date>"2020-09-30";

-- Q8. Display the working duration of each employee in years
select name, timestampdiff(year, joining_date, curdate()) as working_years from employee;

-- Q9. Identify employees who have been working for more than 2000 days
select name, timestampdiff(day, joining_date, curdate()) as working_days from employee having working_days > 2000;

-- Q10. Retrieve employees who joined in the last 1 year
select name, joining_date from employee where joining_date >= date_sub(curdate(), interval 1 year);

-- Q11. Display employees’ names and the day of the week they joined
select name, dayname(joining_date) as day_of_joining from employee;

-- Q12. Find employees who joined in the same month (regardless of year), e.g., all June joiners
select name, month(joining_date) as joining_month from employee where month(joining_date)=6;

-- Q13. Show employees ordered by joining date (oldest first)
select name, joining_date from employee order by joining_date asc;

-- Q14. Calculate the total number of employees who joined each year
select year(joining_date) as joining_year, count(employee_id) as total_employees from employee group by year(joining_date);
