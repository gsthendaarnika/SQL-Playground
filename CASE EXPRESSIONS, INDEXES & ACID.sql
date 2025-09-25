/*============================================================
   SQL PRACTICE NOTES – DAY 9 (CASE EXPRESSIONS, INDEXES & ACID)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================*/
use daarnika;

----------------  CASE EXPRESSIONS (CASE WHEN) ----------------
-- Conditional logic in SQL
select name, salary,
       case
           when salary < 50000 then 'Low'
           when salary between 50000 and 80000 then 'Medium'
           else 'High'
       end as salary_category
from employees3;

-- ✅ IMPORTANT POINTS:
-- 1. CASE can be used in SELECT, WHERE, ORDER BY.
-- 2. Helps classify or transform values dynamically.
-- 3. Evaluates conditions sequentially and returns the first true result.

---------------- INDEXES & PERFORMANCE ----------------
-- Indexes improve query performance by speeding up data retrieval
-- Types of Indexes: PRIMARY KEY, UNIQUE, INDEX, FULLTEXT

-- Creating Index
create index idx_name on employees3(name);

-- Dropping Index
drop index idx_name on employees3;

-- ✅ IMPORTANT POINTS:
-- 1. Indexes speed up SELECT queries but may slow down INSERT/UPDATE/DELETE.
-- 2. Use indexes wisely on columns used in WHERE, JOIN, ORDER BY, GROUP BY.
-- 3. Primary keys automatically create a unique index.

---------------- ACID PROPERTIES ----------------
-- ACID ensures reliable transactions in a database
-- A: Atomicity – All operations in a transaction succeed or none.
-- C: Consistency – Database remains in a valid state after transaction.
-- I: Isolation – Concurrent transactions do not interfere with each other.
-- D: Durability – Once committed, changes are permanent.

-- ✅ EXAMPLE
start transaction;
update employees3 set salary = salary + 5000 where department='HR';
commit; -- Changes are permanent (Durable) and consistent
