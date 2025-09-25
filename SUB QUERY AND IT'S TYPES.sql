/*============================================================
   SQL PRACTICE NOTES – DAY 5 (SUBQUERY & ADVANCED SUBQUERY TYPES)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================*/
use daarnika;

---------------- STUDENT & COURSE TABLE (Subquery Related) ----------------
select * from student;
select * from course;

-- Q1. Find the names of students who are studying Physics.  
Select name from student where course_id = (select course_id from course where name="Physics");

-- Q2. Find the number of students studying Mathematics.  
select count(name) from student where course_id=(select course_id from course where name="Mathematics");

-- Q3. Find the trainer name who is teaching student Jack.  
select trainer from course where course_id=(select course_id from student where name="Jack");

-- Q4. Find the trainer name for Alice.  
select trainer from course where course_id in (select course_id from student where name="Alice");

-- Q5. Find the trainer name who is teaching the student with age between 20 and 21.  
select trainer from course where course_id in (select course_id from student where age between 20 and 21);

-- Q6. Find the course name which is collecting fees in the range 1400-1500.  
select name from course where course_id in (select course_id from student where fees between 1400 and 1500);

#(PRODUCT AND SALES TABLE!)
select * from products;
select * from sales;

-- Q7. Find unsold products using joins.  
select p.name,p.Product_id from products p left join sales s ON p.Product_id=s.product_id where s.product_id is null;

-- Q8. Find unsold products using a subquery.  
select name from products where product_id NOT IN (select product_id from sales);


---------------- EMPLOYEES3 TABLE (Subquery / Nested Query Related) ----------------
CREATE TABLE employees3 (
    EmployeeID INT NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Department VARCHAR(20) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

insert into employees3 values(1,"Alice Johnson","HR",60000),(2,"Bob Smith","HR",70000),(3,"Charlie Brown","IT",80000),(4,"David Wilson","IT",90000),(5,"Eva Green","Sales",50000),(6,"Frank White","Sales",50000),(7,"Grace Black","IT",80000);

SELECT * from employees3;

-- Q1. Find the employee name who is getting salary greater than the average salary.
Select name from employees3 where salary > ( select avg(salary) from employees3);

-- Q2. Find the employee name who is getting salary greater than the minimum salary of Sales department.
select name from employees3 where salary > ( select min(salary) from employees3 where department="Sales");

-- Q3. Find the employee name and department who is getting salary greater than Charlie Brown.
select name, department from employees3 where salary > (select salary from employees3 where name="Charlie Brown");

-- Q4. Find the employee name who is getting salary less than the minimum salary of HR department.
select name from employees3 where salary < (select min(salary) from employees3 where department="HR");

-- Q5. Find the employee name who is getting salary greater than the maximum salary of HR department and also greater than Charlie Brown.
select name from employees3 where salary > (select max(salary) from employees3 where department ="HR") and salary> (select salary from employees3 where name ="Charlie Brown");

-- Q6. Find the employee id, name, and salary of those who are getting average salary or less, compared to the salary of David Wilson. ***
select employeeID, Name, Salary from employees3 where avg(salary) <= (select salary from employees3 where name = "David Wilson");

-- Q7. Find the employee name and department who is getting salary less than the average salary of HR department and also less than the average salary of IT department.
select name , department from employees3 where salary< (select avg(salary) from employees3 where department="HR") and salary<( select avg(salary) from employees3 where department="IT");

-- Q8. Find the nth highest salary in a given dataset.  
select salary from employees3 order by salary desc limit 1 ;

-- Q9. I need to find this employee name who getting salary > average salary
Select name from employees3 where salary > ( select avg(salary) from employees3);

-- Q10. I need to find employee name who’s getting salary> minimum salary of sales department
select name from employees3 where salary>( select min(salary) from employees3 where department = "Sales");

-- Q11. I need to find name, department Who's getting salary> Charlie Brown
select name , department from employees3 where salary in (select salary from employees3 where name ="Charlie Brown"); 

-- Q12. I need to find name who is getting salary less then minimum salary of HR department.
select name from employees3 where salary <(select min(salary) from employees3 where department ="HR");

-- Q13. I need to find the emp name who is getting salary maximum> Salary of Hr department > charlie Brown. ***

-- Q14. I had to find the employee name, department, who is getting salary less than avg salary of HR also less then average salary of IT.
select name, department from employees3 where salary < ( select avg(salary) from employees3 where department="HR") < ( select avg(salary) from employees3 where department="IT");

---------------- EMPLOYEE TABLE (Subquery / Nested Query Related) ----------------

select * from employee; 

-- Q1. I need to find employ name who’s getting Salary> Average Salary
select name from employee where salary> (select avg(salary) from employee);

-- Q2. I need to find How many Employees salary > the maximum salary of Software Engineer
select count(name) from employee where salary > ( select max(salary) from employee where role="Software Engineer");

-- Q3. I need to find who is getting Salary less than the Salary of D.S 
select name from employee where salary < (select salary from employee where role="Data Scientist");

-- Q4. I need to find who is getting salary less than employee whos name start with “e”
select name from employee where salary < ( select salary from employee where name like "e%");

-- Q5. I need to find employee name who is getting salary less than the average salary of employee age less than 20. ***
select name from employee where salary < (select avg(salary) from employee where age <20);

-- Q6. I need to find the employee’s name and department who is getting salary less than jane and greather than robinson ***
select name, role from employee where salary < (select salary from employee where name= "Jane" ) and salary > (select salary from employee where name= "Robinson" );

-- Q7. I need to find the emp name who is getting salary greater than David willson 
select name from employee where salary > (select salary from employee where name = "David Wilson");

-- Q8. I need to find emp name who is getting salary > salary who join on 2021-08-12
select name from employee where salary > (select salary from employee where joining_date="2021-08-12");

-- Q9.rename the column role into department 
alter table employee rename column role to department; 

-- Q10. I need to find the average salary of HR
select avg(salary) from employee where department = "%HR%";

-- Q10. I need to find how many employees join after 2021
select name from employee where year(joining_date)> 2021;

-- Q11. I need to find emp name who getting salary greater than the salary of maximum salary of los angles 
select name from employee where salary > (select max(salary) from employee where location = "Los Angeles");

-- Q12. Retrieve the employee(s) who have the second highest salary. ****
select name,salary from employee order by salary desc limit 1 offset 1;

-- Q13.List employees whose salary is greater than the salary of any employee in the 'Intern' department.
select name from employee where salary in ( select salary from employee where department="Intern");

-- Q14.Get the names of employees who joined before the employee with the earliest joining date in the 'Project Manager' department.
select name from employee where joining_date < (select min(joining_date) from employee where department="Project Manager"); 

-- Q15.Find employees who work in the same department as "Alice Johnson".
select name from employee where department= (select department from employee where name = "Alice Johnson"); 

-- Q16.Retrieve employees who earn more than the minimum salary in the 'Software Engineer' department.
select name from employee where salary > (select min(salary) from employee where department="Software Engineer");

-- Q17.List employees who are older than the average age of employees in their department. *****
select name from employee e1 where age > (select avg(age) from employee e2 where e2.department=e1.department);

-- Q18.Find the department with the highest total salary, and list all employees from that department. ****
select name from employee where department = (select department from employee group by department order by sum(salary) desc limit 1);

-- Q19.Get employees who joined after the employee with the maximum salary. ****
SELECT name FROM employee WHERE joining_date > (SELECT joining_date FROM employee WHERE salary = (SELECT MAX(salary) FROM employee) );

-- Q20.Find the employees who earn less than the average salary of employees in 'New York'.
select name from employee where salary < (select avg(salary) from employee where location="New York");


---------------- DATA TABLE (Related) ----------------
select * from data;
-- Q1. I need to find the category with sold out more than the average sales 
select category from data where sales > (select avg(sales) from data);

-- Q2. I need to find the custom name who purchased quantity 5 and sales above 260
select c_name from data where quantity=5 and sales >260;


---------------- Multi-row subqueries (ANY, ALL) ----------------
-- Q1. Find employees earning more than ANY salary of Sales department
select name from employees3 where salary > ANY (select salary from employees3 where department="Sales");

-- Q2. Find employees earning more than ALL salaries of Sales department
select name from employees3 where salary > ALL (select salary from employees3 where department="Sales");


---------------- Correlated subqueries ----------------
select * from employees3;
-- Q3. Employees earning more than the average salary of their own department
select name, department, salary from employees3 e1 where salary > (select avg(salary) from employees3 e2 where e2.department = e1.department);

-- Q4. Employees from the department with the highest total salary
select name, department from employees3 where department = (select department from employees3 group by department order by sum(salary) desc limit 1);


---------------- Subqueries in FROM, WHERE, SELECT ----------------
-- Q5. Subquery in FROM: average salary per department
select department, avg_salary from (select department, avg(salary) as avg_salary from employees3 group by department) as dept_avg;

-- Q6. Subquery in SELECT: show employee name and overall average salary
select name, (select avg(salary) from employee) as avg_salary from employees3;

