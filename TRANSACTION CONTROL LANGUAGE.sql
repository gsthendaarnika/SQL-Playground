/*============================================================
   SQL PRACTICE NOTES – DAY 8 (TCL – TRANSACTION CONTROL LANGUAGE)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================*/
use daarnika;

---------------- EMPLOYEES3 TABLE ----------------
select * from employees3;

---------------- TRANSACTION CONTROL ----------------

-- 1️. START TRANSACTION
-- Begins a new transaction
start transaction;

-- Example: Update employee names in HR department
update employees3 set name = "alice" where department="HR";

-- 2️. SAVEPOINT
-- Marks a point within a transaction to rollback if needed
savepoint initial;

-- Example: Delete employees in IT department
delete from employees3 where department ="IT";
savepoint one;

-- 3️. SELECT to verify changes within transaction
select * from employees3;

-- 4️. ROLLBACK TO SAVEPOINT
-- Rolls back changes to a specific savepoint
rollback to initial;

-- ✅ IMPORTANT POINTS:
-- 1. Transactions group multiple operations into a single unit of work.  
-- 2. SAVEPOINT allows partial rollback within a transaction.  
-- 3. COMMIT finalizes all changes made in the transaction.  
-- 4. ROLLBACK undoes changes either fully or up to a savepoint.  
-- 5. TCL commands: START TRANSACTION, SAVEPOINT, ROLLBACK, COMMIT.  
