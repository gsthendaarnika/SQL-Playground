/*============================================================
   SQL PRACTICE NOTES – DDL, DML, DQL
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */
   
#Create a new database
create database daarnika;

#Drop a database (Deletes permanently)
drop database daarnika; 

#Select a database to use
use daarnika;

#TABLE CREATION (DDL)
-- Create a table with NOT NULL constraints
create table daar(name varchar(20) not null, age int not null, salary int not null); 

#Retriving the whole table
select * from daarni;
-- Explanation: Will throw error if table not renamed yet. 
-- Best practice: Always check current table name before selecting.

#DATA INSERTION (DML)
-- Insert multiple rows in a single query
insert into daar values( "abi", 21, 20000),("daarnika",21,20000),("mahitra",18,20000);

#ALTER TABLE (DDL)
-- Rename column
alter table daar rename column salary to income;
-- Rename table
alter table daar rename to daarni; 
-- Modify column size
alter table daarni modify column name varchar(30);
-- Add new column
alter table daarni add column place varchar(20);
-- Drop column
alter table daarni drop column place;
-- Note: ALTER is used for structural changes. DELETE/TRUNCATE only deal with data.

#UPDATE RECORDS (DML)
-- Update specific records
update daarni set place ="cbe" where name="abi";
update daarni set place ="chennai" where name ="daarnika";
update daarni set place ="Andra" where name ="mahitra";

#DELETE / DROP / TRUNCATE
-- Drop table (structure + data removed)
drop table daarni;

-- Truncate table (removes only data, keeps structure)
truncate table daarni;

-- Delete specific record
delete from daarni where name="mahitra";

-- Insert again with new values
insert into daarni values("mahitra", 18, 20000,"andra"); 

#NEW TABLE + PRACTICE (DDL + DML)
create table emp (id int not null, name varchar(20) not null, course varchar(20) not null, fees int not null);
insert into emp values ( 1,"Abi","DA",10000),(2,"Alex","DA",10000),(3,"Jagan","DS",10000),(4,"Sanjay","DA",2000);
select * from emp;

-- Practice Questions
-- Q1. Rename the column course → courses
alter table emp rename column course to courses;

-- Q2. Update Alex's course to "DS"
update emp set courses="DS" where name="Alex";

-- Q3. Update Jagan's fees to 1500
update emp set fees=1500 where name ="Jagan";

-- Q4. Modify data type of column name
alter table emp modify column name char(10);

-- Q5. Rename the table
alter table emp rename to sla;

-- Q6. Delete record where id = 4
delete from sla where id=4;
-- Note: DELETE removes specific rows, DROP removes table, TRUNCATE clears all rows but keeps structure.

#CONSTRAINTS PRACTICE (DDL)

-- Teachers table with constraints
-- Create a table Teachers with constraints: TeacherID (Primary Key), Name (NOT NULL), Email (Unique), Phone (Check length=10), Subject (Default 'General').
create table Teachers(TeacherID int primary key , Name varchar(20) not null, Email varchar(20) unique, Phone varchar(10) check(CHAR_LENGTH(Phone)=10), Subject varchar(20) default "General"); 
select * from Teachers;

-- Insert valid record
insert into Teachers(TeacherID, Name, Email, Phone) values( 123, "daarnika", "daarnika@gmail.com", "1234567890"); #General appears in column subject, without mentioning in specific

-- Insert valid record
insert into teachers values( 134, "abishek", "abishek@gmail.com", "12345", "chemistry");
-- [EDIT] Explanation: THis will throw an error because CHECK requires phone = 10 digits.

#KEYS (PRIMARY / FOREIGN / COMPOSITE)

-- Composite Primary Key
create table emp1(order_id int not null, product_id int not null, primary key(order_id, product_id)); 
-- Foreign Key Example
create table teachers1(teacher_id int primary key, name varchar(20) not null, email varchar(20) check(char_length(email)=10), subject varchar(20) default "general");
create table students1(student_id int not null, name varchar(20) not null, email varchar(20) unique , age int not null, teacher_id int, foreign key(teacher_id) references teachers1(teacher_id)); 
-- Note: Foreign key ensures referential integrity (teacher_id must exist in teachers1).

#CHECK CONSTRAINT
create table nme1 (name varchar(20) not null, age int check(age between 18 and 30)); 
insert into nme1 values( "daarnika", 20);

#PRACTICE DATASET (DQL Examples)
CREATE TABLE data (
    orderid INT PRIMARY KEY,
    c_name VARCHAR(25) NOT NULL,
    location VARCHAR(15) NOT NULL,
    category VARCHAR(20) NOT NULL,
    unitprice INT NOT NULL,
    quantity INT NOT NULL,
    total INT NOT NULL
);

INSERT INTO data (orderid, c_name, location, category, unitprice, quantity, total) VALUES
(1, 'Sarah Lee', 'Mexico City', 'Electronics', 150, 1, 150),
(2, 'Michael Wong', 'Toronto', 'Furniture', 300, 1, 300),
(3, 'Emily Davis', 'San Francisco', 'Furniture', 150, 3, 450),
(4, 'David Kim', 'Vancouver', 'Clothing', 50, 5, 250),
(5, 'Sophia Patel', 'Tokyo', 'Electronics', 250, 2, 500),
(6, 'Liam Nguyen', 'Mexico City', 'Furniture', 400, 1, 400),
(7, 'Isabella Rossi', 'Toronto', 'Clothing', 75, 3, 225),
(8, 'Ethan Müller', 'San Francisco', 'Electronics', 180, 2, 360),
(9, 'Olivia Sato', 'Vancouver', 'Furniture', 350, 1, 350),
(10, 'Noah Dupont', 'Tokyo', 'Clothing', 60, 4, 240),
(11, 'Emma Hernandez', 'Mexico City', 'Electronics', 220, 2, 440),
(12, 'Jacob Kowalski', 'Toronto', 'Furniture', 280, 2, 560),
(13, 'Ava Morales', 'San Francisco', 'Clothing', 55, 5, 275),
(14, 'William Tanaka', 'Vancouver', 'Electronics', 190, 3, 570),
(15, 'Mia Dupuis', 'Tokyo', 'Furniture', 320, 1, 320),
(16, 'Alexander Ivanov', 'Mexico City', 'Clothing', 65, 4, 260),
(17, 'Isabella Garcia', 'Toronto', 'Electronics', 230, 2, 460),
(18, 'Daniel Moreno', 'San Francisco', 'Furniture', 290, 2, 580),
(19, 'Sophia Nguyen', 'Vancouver', 'Clothing', 70, 3, 210),
(20, 'John Smith', 'Tokyo', 'Electronics', 200, 2, 400);

select * from data;
-- Q1. Show only the customer name, quantity, and total sales
select c_name, quantity, total from data;

-- Q2. List the customer name and location where category is Furniture.
select c_name , location from data where category="Furniture";

-- Q3. Get all records where the quantity > 1
select * from data where quantity > 1;

-- Q4. Retrieve location and category where sales exceed 200
select location , category from data where total >200;

-- Q5. Display details where sales between 200 and 500
select * from data where total between 200 and 500;

-- Q6. Find customers who bought Furniture and quantity > 1
select c_name from data where category="Furniture" and quantity>1;

-- Q7. Show all info where category = Electronics AND location = Tokyo
select * from data where category="Electronics" and location="Tokyo";

-- Q8. Get customer names where unit price > 300
select c_name from data where unitprice>300;

-- Q9. List unique locations where quantity > 4
select distinct location from data where quantity>4; #distinct keyword is used to retrive unique values

-- Q10. Show location(s) where unit price < 500
select location from data where unitprice<500;

-- Q11. Customers where unit price < 80 AND quantity > 3
select c_name from data where unitprice<80 and quantity>3;

-- Q12. Customers whose name starts with 'S'
select * from data where c_name like "s%"; 

-- Q13. Customers whose name starts with 'Li'
select * from data where c_name like "li%";

-- Q14. Customers whose name ends with 'a'
select * from data where c_name like "%a";

-- Q15. Names where 2nd letter = 'a'
select * from data where c_name like "_a%";

-- Q16. Names containing 'a'
select * from data where c_name like "%a%";

#EMPLOYEE DATASET (DQL)

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    joining_date DATE,
    age INT,
    role VARCHAR(50),
    location VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Employee (employee_id, name, joining_date, age, role, location, salary) VALUES
(1, 'John Smith', '2020-01-15', 30, 'Software Engineer', 'New York', 80000.00),
(2, 'Jane Do', '2019-03-22', 28, 'HR Manager', 'Los Angeles', 75000.00),
(3, 'Alice Johnson', '2021-06-10', 35, 'Data Analyst', 'Chicago', 70000.00),
(4, 'Bob Brown', '2022-02-05', 40, 'Project Manager', 'Houston', 90000.00),
(5, 'Charlie White', '2023-05-30', 26, 'Intern', 'Miami', 30000.00),
(6, 'David Wilson', '2021-08-12', 32, 'Software Engineer', 'Seattle', 82000.00),
(7, 'Emily Davis', '2020-11-20', 29, 'HR Assistant', 'San Francisco', 60000.00),
(8, 'Frank Miller', '2019-07-15', 38, 'Data Scientist', 'Boston', 95000.00),
(9, 'Grace Lee', '2022-03-18', 31, 'Project Coordinator', 'Denver', 72000.00),
(10, 'Henry Garcia', '2023-01-25', 27, 'Intern', 'Austin', 35000.00),
(11, 'Isabella Martinez', '2021-04-30', 34, 'Software Engineer', 'New York', 81000.00),
(12, 'Jack Thompson', '2020-09-10', 36, 'HR Manager', 'Los Angeles', 77000.00),
(13, 'Karen Robinson', '2021-12-05', 29, 'Data Analyst', 'Chicago', 71000.00),
(14, 'Liam Anderson', '2022-05-15', 41, 'Project Manager', 'Houston', 92000.00),
(15, 'Mia Clark', '2023-03-20', 25, 'Intern', 'Miami', 32000.00);

-- Q1: Get the employee_id and name for those whose age is between 35 and 40 (inclusive).
select employee_id, name from employee where age between 35 and 40;

-- Q2: Find employee name and joining date where salary is between 70,000 and 85,000.
select name, joining_date from employee where salary between 70000 and 85000;

-- Q3: Retrieve name, joining date, and salary of employees with the role 'Data Analyst'.
select name, joining_date, salary from employee where role="Data Analyst";

-- Q4: List employee names who earn a salary above 80,000.
select name from employee where salary>80000;

-- Q5: Get joining date, age, and name of employees aged over 27 AND earning above 74,000.
select joining_date, age, name from employee where age>27 and salary>74000;

-- Q6: Show employee name, location, and salary where the name starts with 'C'.
select name, location, salary from employee where name like "c%";

-- Q7: Find names of employees whose role starts with the letter 'D'.
select name from employee where role like "d%";

-- Q8: Get employee name and joining date for those whose role ends with 'Manager'.
select name , joining_date from employee where role like "%Manager";

-- Q9: List employee name and role for those whose name contains the letter 'a'.
select name, role from employee where name like "%a%";

-- Q10: Retrieve employee_id and name where the joining date is between 2021-06-10 and 2025-01-01.
select employee_id,name from employee where joining_date between "2021-06-10" and "2025-01-01";

-- Q11: Show employee name and joining date for those located in New York.
select name, joining_date from employee where location="New York";

-- Q12: Get employee name and role for employees aged 26.
select name, role from employee where age=26;

-- Q13: List employees working in San Francisco.
select * from employee where location="San Francisco";

-- Q14: Fetch employee name, location, and salary where the name starts with 'Jack'.
select name, location, salary from employee where name like "jack%";

-- Q15: Get names of employees whose fourth letter in their name is 'c'.
select name from employee where name like "___c%";
