Use daarnika;

# DDL (Data Definition Language)

-- Q1. Create a table Students with columns: StudentID (INT, Primary KEY)Name (VARCHAR(50), NOT NULL), Age (INT, check Age > 15), Email (Unique)
create table students (StudentId int primary key, Name varchar(50) not null, age int check(age>15), email varchar(30) unique);

-- Q2. Alter the Students table to add a column Department VARCHAR(30).
alter table students add column Department varchar(30);

-- Q3. Rename the column Name to FullName in Students table.
alter table students rename column Name to Full_name;

-- Q4. Drop the Department column from Students.
alter table students drop column department 

-- Q5. Drop the table Students.
drop table students;


# DML (Data Manipulation Language)

-- Q6. Insert 5 rows into Students with values of your choice.
insert into students(StudentId, Full_Name, age, email) values ( 123, "daarnika", 21, "daarnika@gmail.com"),(145, "abishek", 21, "abishek@gmail.com"),(167, "mahitra", 18, "mahitra@gmail.com"),(189,"priya", 43, "priya@gmail.com"),(987,"senthil",50,"senthil@gmail.com");

-- Q7. Update the Email of a student where StudentID = 145.
update students set email="abishek29@gmail.com" where StudentId=145;

-- Q8. Delete a student where Age < 18.
delete from students where age<18 and full_name="priya";

-- Q9. Increase the Age of all students by 1 year.
update students set age= age+1;
select * from students;

#DQL (Data Query Language – SELECT)

-- Q10. Select all students where Age > 20.
select * from students where age>20;

-- Q11.Select only FullName and Email of students.
select full_name, email from students 

-- Q12. Display students ordered by Age in descending order.
select * from students order by age desc;

-- Q13. Count the total number of students in the table.
select count(StudentID) FROM students ;

-- Q14. Find the average age of students.
select avg(age) from students;

-- Q15. Select students whose Name starts with ‘A’.
select full_name from students where full_name like "a%";

-- Q16. Get the student with the maximum age.
select max(age) from students 

-- Q17. Group students by Department and count how many are in each department.
update students set department="chemistry" where full_name ="daarnika";
update students set department="chemistry" where full_name ="abishek";
update students set department="biology" where full_name ="mahitra";
update students set department="physics" where full_name ="priya";
update students set department="biology" where full_name ="senthil";
select department ,count(full_name) as student_count from students group by department;