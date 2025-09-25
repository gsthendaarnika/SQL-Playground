/*============================================================
   SQL PRACTICE NOTES – DAY 8 (TRIGGERS)
   Author: ThenDaarnika GS
   Purpose: Interview preparation & SQL learning
============================================================*/
use code;

---------------- TRIGGERS ----------------

-- 1️. BEFORE UPDATE Trigger
-- Automatically updates a column before a row is updated
create trigger updation1 
before update on salary 
for each row 
set new.pay = new.hours * 100;

-- Verify table after trigger operation
select * from salary;


-- 2️. AFTER INSERT Trigger
-- Automatically logs actions after insert into another table
create table audit (
    id int not null, 
    action varchar(20) not null, 
    time datetime
);

create trigger mock after insert on sla for each row insert into audit values(new.id, "ins", now());

-- Insert into SLA table to test trigger
insert into sla values(4, "Abishek", "DA", 400);

-- Verify data in SLA and Audit tables
select * from sla;
select * from audit;


-- ✅ IMPORTANT POINTS:
-- 1. Triggers are automatic actions that fire before/after insert, update, or delete.  
-- 2. BEFORE triggers allow modification of incoming data.  
-- 3. AFTER triggers are useful for logging, auditing, or cascading changes.  
-- 4. Each trigger executes for every row affected (FOR EACH ROW).  
-- 5. Triggers cannot return values like functions; they are procedural.  
