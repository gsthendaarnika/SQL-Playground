/*============================================================
   SQL PRACTICE NOTES – DAY 3 (NULL FUNCTIONS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */

-- Create sample table with NULL values
CREATE TABLE nulls (
    id INT NOT NULL,
    firstname VARCHAR(20) UNIQUE,
    middlename VARCHAR(20) UNIQUE,
    salary INT UNIQUE
);

-- Insert data with some NULL values
INSERT INTO nulls (id, firstname, middlename, salary) 
VALUES 
    (1, NULL, 'John', 50000),
    (2, 'Alice', NULL, NULL),
    (3, NULL, 'Bob', 60000),
    (4, 'Charlie', NULL, NULL),
    (5, NULL, 'David', 70000);

-- View table data
select * from nulls;

-- Q1. Check if a value is NULL using ISNULL()
SELECT firstname, ISNULL(firstname) FROM nulls;
-- ISNULL(column) → Returns 1 if value is NULL, 0 if NOT NULL

-- Q2. Replace NULL with custom value using IFNULL()
SELECT firstname, IFNULL(middlename, 'None') FROM nulls;
-- IFNULL(column, value) → Returns column value if NOT NULL, else returns value

-- Q3. Return the first non-NULL value using COALESCE()
SELECT COALESCE(firstname, middlename, 'Unknown') FROM nulls;
-- COALESCE(col1, col2, ..., value) → Returns first non-NULL from the list
