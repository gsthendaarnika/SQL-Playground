/*============================================================
   SQL PRACTICE NOTES – DAY 4 (JOINS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */

---------------- SALES, PRODUCT & CUSTOMER TABLE ----------------

CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    address VARCHAR(255)
);

INSERT INTO Customers (customer_id,name, email, address) VALUES
(101,'Alice Johnson', 'alice.johnson@example.com', '123 Maple St.'),
(102,'Bob Smith', 'bob.smith@example.com', '456 Oak St.'),
(103,'Charlie Brown', 'charlie.brown@example.com', '789 Pine St.'),
(104,'David Wilson', 'david.wilson@example.com', '321 Elm St.'),
(105,'Eva Green', 'eva.green@example.com', '654 Cedar St.');

CREATE TABLE Products (
    Product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO Products (product_id, name, price) VALUES
(201, 'Laptop', 1200.00),
(202, 'Smartphone', 800.00),
(203, 'Tablet', 400.00),
(204, 'Headphones', 150.00),
(205, 'Smartwatch', 250.00);

CREATE TABLE Sales (
    order_id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    sales_date DATE,
    quantity INT NOT NULL,
    total INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO sales (order_id, customer_id, product_id, sales_date, quantity, total) VALUES
(31, 101, 201, '2024-01-15', 1, 1200.00),  
(32, 102, 202, '2024-01-16', 2, 1600.00),  
(33, 102, 201, '2024-01-17', 1, 1200.00),  
(34, 102, 203, '2024-01-18', 3, 1200.00),  
(35, 103, 202, '2024-01-19', 1, 800.00),   
(36, 103, 204, '2024-01-20', 2, 300.00),   
(37, 104, 205, '2024-01-21', 1, 250.00),   
(38, 105, 201, '2024-01-22', 1, 1200.00);

SELECT * FROM CUSTOMERS ;
SELECT * FROM SALES;
SELECT * FROM PRODUCTS;
alter table sales rename column total to amount;

-- Q1. Find the total sales for each product.  
SELECT SUM(s.amount) ,p.name from products p inner join sales s on s.product_id= p.product_id group by p.name;

-- Q2. Find how many quantities were purchased by each customer.  
select sum(s.quantity),c.name from sales s inner join customers c on s.customer_id=c.customer_id group by c.name;

-- Q3. Find the customer name and email_id who purchased quantity = 3.  
select c.name, c.email from customers c inner join sales s on c.customer_id=s.customer_id where s.quantity=3;

-- Q4. Find the product name that was sold out on 2024-01-17.  
select p.name from products p inner join sales s on p.product_id=s.product_id where s.sales_date="2024-01-17";

-- Q5. Find the count of products sold out between 17th Jan and 21st Jan.  
select count(p.name) from products p inner join sales s on p.product_id=s.product_id where s.sales_date between "2024-01-17" and "2024-01-21";

-- Q6. Find the highest purchased product.  
select p.name, sum(s.quantity) from products p inner join sales s on p.product_id=s.product_id group by p.name order by sum(s.quantity) desc limit 1;

-- Q7. Find the customer name who purchased total sales above 2000.  
select c.name,sum(s.amount) from customers c inner join sales s on c.customer_id=s.customer_id group by c.name having sum(s.amount)>2000;

-- Q8. Find the total quantity sold out for each product.  
select p.name, sum(s.quantity) from sales s inner join products p on s.product_id = p.product_id group by p.name;

-- Q9. Find the total sales for 'Smart Phone'.  
select sum(s.amount) from sales s inner join products p on s.product_id=p.product_id where p.name="Smartphone";

-- Q10. Find how many quantities were purchased by Bob Smith.  
select sum(s.quantity) from sales s inner join customers c on c.customer_id=s.customer_id where c.name="Bob Smith";

-- Q11. FIND THE UNSOLD PRODUCT  
SELECT p.Product_id, p.name, p.price FROM products p LEFT JOIN sales s ON p.Product_id = s.product_id WHERE s.product_id IS NULL;


---------------- STUDENT & COURSE TABLE ----------------

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    trainer VARCHAR(50) NOT NULL
);

INSERT INTO course (course_id, name, trainer) VALUES
(1, 'Computer Science', 'Dr. Smith'),
(2, 'Mathematics', 'Prof. Johnson'),
(3, 'Physics', 'Dr. Brown'),
(4, 'Chemistry', 'Dr. White'),
(5, 'Biology', 'Prof. Green');

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100),
    course_id INT,
    age INT,
    fees DECIMAL(10, 2),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO student (id, name, address, course_id, age, fees) VALUES
(1, 'Alice', '123 Maple St.', 1, 20, 1500.00),
(2, 'Bob', '456 Oak St.', 2, 22, 1200.00),
(3, 'Charlie', '789 Pine St.', 3, 21, 1300.00),
(4, 'David', '321 Elm St.', 4, 23, 1400.00),
(5, 'Eva', '654 Cedar St.', 5, 19, 1100.00),
(6, 'Frank', '987 Birch St.', 1, 20, 1500.00),
(7, 'Grace', '135 Maple St.', 2, 22, 1200.00),
(8, 'Henry', '246 Oak St.', 3, 21, 1300.00),
(9, 'Irene', '369 Pine St.', 4, 23, 1400.00),
(10, 'Jack', '147 Elm St.', 5, 19, 1100.00),
(11, 'Alice', '123 Maple St.', 2, 20, 1500.00),  
(12, 'Alice', '123 Maple St.', 3, 20, 1500.00),  
(13, 'Bob', '456 Oak St.', 4, 22, 1200.00),      
(14, 'Bob', '456 Oak St.', 5, 22, 1200.00),      
(15, 'Charlie', '789 Pine St.', 4, 21, 1300.00), 
(16, 'Charlie', '789 Pine St.', 5, 21, 1300.00);

SELECT * FROM student;
SELECT * FROM course;

-- Q12. Find the names of trainers who are teaching students who are older than 21 years.  
select DISTINCT c.trainer from student s inner join course c on s.course_id= c.course_id where s.age>21;

-- Q13. Retrieve the trainer name and course name for students whose names end with 'y'.  
Select c.trainer,c.name from course c inner join student s on s.course_id=c.course_id where s.name like "%y";

-- Q14. Find the total fees collected for each course.  
Select sum(s.fees), c.name from student s inner join course c on s.course_id=c.course_id group by c.name;

-- Q15. Find how many students are taught by Dr. Smith.  
select count(s.name) from student s inner join course c on s.course_id=c.course_id where c.trainer="Dr. Smith";

-- Q16. Find how many students are enrolled in the Biology course.  
select count(s.name) from student s inner join course c on s.course_id=c.course_id where c.name="Biology";

-- Q17. Retrieve the number of students assigned to each trainer.  
select count(s.name),c.trainer from student s inner join course c on s.course_id=c.course_id group by c.trainer;

-- Q18. Find the course that collects the highest total fees.  
select c.name,sum(s.fees) from student s inner join course c on s.course_id=c.course_id group by c.name order by sum(s.fees) desc limit 1;

-- Q19. List the courses and trainer names where the fees collected is exactly 1400.  
select c.name, c.trainer from student s inner join course c on s.course_id=c.course_id where s.fees=1400;

-- Q20. Identify the trainer who has the highest number of students.  
select c.trainer , count(s.name) from student s inner join course c on s.course_id=c.course_id group by c.trainer order by count(s.name) desc limit 1;

-- Q21. Find the course names where the total fees collected is more than 4500.  
select c.name, sum(s.fees) from student s inner join course c on s.course_id=c.course_id group by c.name having sum(s.fees)>4500;

-- Q22. Retrieve the trainer names and course names where the total number of students is exactly 2.  
select c.trainer,c.name,count(s.name) from student s inner join course c on s.course_id=c.course_id group by c.trainer, c.name having count(s.name)=2;

-- Q23. Find the total fees collected for the course 'Physics'.  
select sum(s.fees), c.name from student s inner join course c on s.course_id=c.course_id where c.name="Physics";

---------------- ADDITIONAL JOINS ----------------
Use daarnika;
-- RIGHT JOIN: All rows from right table, matched left rows, unmatched → NULL
SELECT s.name AS student_name, c.name AS course_name FROM student s RIGHT JOIN course c ON s.course_id = c.course_id;

-- FULL OUTER JOIN: All rows from both tables; unmatched → NULL (MySQL workaround)
SELECT s.name AS student_name, c.name AS course_name FROM student s LEFT JOIN course c ON s.course_id = c.course_id UNION SELECT s.name AS student_name, c.name AS course_name FROM student s RIGHT JOIN course c ON s.course_id = c.course_id;

-- SELF JOIN: Table joined with itself
SELECT a.name AS student1, b.name AS student2, c.name AS course_name FROM student a INNER JOIN student b ON a.course_id = b.course_id AND a.id <> b.id INNER JOIN course c ON a.course_id = c.course_id;

-- CROSS JOIN: Cartesian product (all possible combinations)
SELECT s.name AS student_name, c.name AS course_name FROM student s CROSS JOIN course c;

---------------- KEY POINTS ----------------
-- 1. INNER JOIN → Only matching rows from both tables.  
-- 2. LEFT JOIN → All left table rows + matched right rows; unmatched → NULL.  
-- 3. RIGHT JOIN → All right table rows + matched left rows; unmatched → NULL.  
-- 4. FULL OUTER JOIN → All rows from both tables; unmatched → NULL. Use LEFT JOIN + RIGHT JOIN UNION in MySQL.  
-- 5. SELF JOIN → Table joined with itself for comparisons.  
-- 6. CROSS JOIN → Cartesian product of both tables.  
-- 7. Table aliases (s, c, p, a, b) improve readability.  
-- 8. Use JOIN conditions carefully to avoid unintended Cartesian products.  
