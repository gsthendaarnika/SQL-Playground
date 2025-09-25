# SQL Practice Notes – Days 1 to 9  

This repository contains my **SQL practice notes** prepared in **MySQL Workbench**.  
It covers SQL topics from **basics to advanced concepts**, following a structured 9-day learning plan.  
The purpose of this work is **interview preparation** and **strengthening SQL fundamentals**.

---

## Day-wise Learning

### Day 1: DDL, DML & DQL  
- **DDL (Data Definition Language)**: `CREATE`, `ALTER`, `DROP`, `TRUNCATE` tables & databases.  
- **DML (Data Manipulation Language)**: `INSERT`, `UPDATE`, `DELETE` records.  
- **DQL (Data Query Language)**: `SELECT` statements, filtering with `WHERE`, `LIKE`, `BETWEEN`, `DISTINCT`.  
- **Constraints & Keys**: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `CHECK`, `DEFAULT`.

---

### Day 2: Date, String & Numeric Functions, Aggregate Functions  
- **Date Functions**: `CURDATE()`, `DATE_ADD()`, `DATEDIFF()`, etc.  
- **String Functions**: `CONCAT()`, `SUBSTRING()`, `LENGTH()`, `TRIM()`, `UPPER()/LOWER()`.  
- **Numeric Functions**: `ROUND()`, `FLOOR()`, `CEIL()`, `ABS()`.  
- **Aggregate Functions**: `SUM()`, `AVG()`, `MIN()`, `MAX()`, `COUNT()`.

---

### Day 3: Set Operators, Logical Operators & Handling NULLs  
- **Set Operators**: `UNION`, `UNION ALL`, `INTERSECT`, `EXCEPT`.  
- **Logical Operators**: `AND`, `OR`, `NOT`, `IN`, `BETWEEN`.  
- **NULL Handling**: `IS NULL`, `IFNULL()`, `COALESCE()`.

---

### Day 4: Joins & Combining Tables  
- **INNER JOIN**, **LEFT JOIN**, **RIGHT JOIN**, **FULL OUTER JOIN**.  
- Filtering joined data with `ON` and `WHERE`.  
- Practical examples combining `student` and `course` tables.  

---

### Day 5: Subqueries & Advanced Subquery Types  
- **Single-row** and **multi-row subqueries** (`=`, `IN`, `ANY`, `ALL`).  
- **Correlated subqueries** (dependent on outer query).  
- Subqueries in `FROM`, `WHERE`, `SELECT`.  
- Ranking and filtering using subqueries.

---

### Day 6: Window Functions, CTEs & Views  
- **Window Functions**: `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`.  
- Partitioning by group (`PARTITION BY`) for analytics.  
- **LEAD() / LAG()** for comparing rows within groups.  
- **CTEs (Common Table Expressions)** using `WITH`.  
- **Views**: Permanent saved queries; simple and complex joins.

---

### Day 7: Stored Procedures & Functions  
- **Stored Procedures** with `IN` and `OUT` parameters.  
- Calling procedures and capturing output.  
- **Functions**: Custom SQL functions with conditional logic (`IF`, `ELSEIF`, `ELSE`).  
- Using `DELIMITER` for procedure and function definitions.

---

### Day 8: Triggers & Transaction Control (TCL)  
- **Triggers**: Automatic actions on `INSERT`, `UPDATE`, `DELETE`.  
- Maintaining **audit logs** automatically.  
- **Transactions**: `START TRANSACTION`, `SAVEPOINT`, `ROLLBACK`, `COMMIT`.  
- Ensuring **atomicity** and consistency during multiple operations.

---

### Day 9: Case Expressions, Indexes & ACID Properties  
- **CASE WHEN** expressions for conditional logic in queries.  
- **Indexes**: `CREATE INDEX`, `DROP INDEX`, impact on performance.  
- **ACID Properties**:  
  - **Atomicity** – all or nothing.  
  - **Consistency** – database remains in valid state.  
  - **Isolation** – concurrent transactions don’t interfere.  
  - **Durability** – committed changes are permanent.

---

## Practice Datasets  
- **Students & Courses** – Joins, subqueries, aggregates.  
- **Employees & Employees3** – Window functions, CTEs, ranking, stored procedures, functions.  
- **Sales & Products** – Filters, aggregates, triggers, stored procedures.  
- **Data Table** – Aggregate functions, subqueries, CASE expressions.

---

## How to Use  
1. Download the repository ZIP file.  
2. Open **MySQL Workbench**.  
3. Run SQL scripts day by day, following this order:  
   - DDL → DML → DQL → Joins → Subqueries → Window functions → Procedures/Functions → Triggers → Transactions → Advanced queries.  
4. Use **TRUNCATE or DROP** to reset tables before re-running scripts.


---

## 👩‍💻 Author  
**ThenDaarnika GS**  
ECE Graduate | SQL Enthusiast | Data Analytics Learner
