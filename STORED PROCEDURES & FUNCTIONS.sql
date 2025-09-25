/*============================================================
   SQL PRACTICE NOTES – DAY 2 (STORED PROCEDURES & FUNCTIONS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================ */


USE code;

---------------- DATA TABLE ----------------
SELECT * FROM data;

---------------- STORED PROCEDURES ----------------

-- 1. Simple Procedure: Retrieve row by order ID
DELIMITER ##
CREATE PROCEDURE sla(IN id INT)
BEGIN
    SELECT * FROM data WHERE orderid = id;
END ##
DELIMITER ;

-- Call the procedure
CALL sla(7);

-- 2. Procedure with OUT parameter: Get sales value
DELIMITER ##
CREATE PROCEDURE data_sp1(IN id1 INT, OUT abc INT)
BEGIN
    SELECT sales INTO abc FROM data WHERE orderid = id1;
END ##
DELIMITER ;

-- Using the OUT parameter
SET @ans = 0;
CALL data_sp1(6, @ans);
SELECT @ans;

---------------- FUNCTIONS ----------------

-- User-defined function to calculate incentive based on salary
DELIMITER //
CREATE FUNCTION CalculateIncentive(emp_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE incentive DECIMAL(10,2);

    IF emp_salary < 50000 THEN
        SET incentive = emp_salary * 0.10;
    ELSEIF emp_salary BETWEEN 50000 AND 80000 THEN
        SET incentive = emp_salary * 0.07;
    ELSE
        SET incentive = emp_salary * 0.05;
    END IF;

    RETURN incentive;
END //
DELIMITER ;

-- Apply the function to employees3 table
SELECT name, salary, CalculateIncentive(salary) AS incentive
FROM employees3;

---------------- ✅ IMPORTANT POINTS ----------------
-- 1. Stored Procedures:
--    - Encapsulate multiple SQL statements.
--    - Can accept IN, OUT, or INOUT parameters.
--    - Useful for repeated or complex operations.
-- 2. Functions:
--    - Return a single value.
--    - Can be used in SELECT, WHERE, or ORDER BY clauses.
--    - Must be deterministic if same input should always produce same output.
-- 3. DELIMITER is used to define custom procedure/function boundaries in MySQL.
-- 4. OUT parameters store values that can be retrieved after procedure execution.
