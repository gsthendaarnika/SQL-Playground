# SQL-Playground

# SQL Practice – DDL, DML, DQL  

This repository contains my SQL practice notes prepared in **MySQL Workbench**.  
It covers **Data Definition Language (DDL)**, **Data Manipulation Language (DML)**, and **Data Query Language (DQL)**, along with examples of constraints, keys, and practice datasets.  
The purpose of this work is interview preparation and strengthening SQL fundamentals.  

---

##  What’s Inside  

### DDL (Data Definition Language)  
- Creating and dropping databases.  
- Creating tables with `NOT NULL`, `PRIMARY KEY`, `UNIQUE`, `CHECK`, and `DEFAULT`.  
- Using `ALTER TABLE` to:  
  - Rename tables and columns.  
  - Modify column datatypes.  
  - Add or drop columns.  
- Dropping and truncating tables.  

### DML (Data Manipulation Language)  
- Inserting multiple rows in one query.  
- Updating records with `WHERE`.  
- Deleting specific rows.  

### DQL (Data Query Language)  
- Selecting all records.  
- Filtering with `WHERE`, `BETWEEN`, `LIKE`, `AND`, `OR`.  
- Using `ORDER BY` and `DISTINCT`.  
- Counting records.  

### Constraints & Keys  
- **Primary Key** – Unique identifier for rows.  
- **Foreign Key** – Ensures referential integrity between tables.  
- **Composite Key** – Multiple columns as a primary key.  
- **Check Constraint** – Enforces valid ranges or formats.  

### Practice Datasets  
1. **Teachers Table** → Practice with constraints (PK, NOT NULL, UNIQUE, CHECK, DEFAULT).  
2. **Employee Table** → DQL queries with filters on age, salary, roles, and dates.  
3. **Sales Data Table** → Queries using `WHERE`, `LIKE`, `BETWEEN`, and `DISTINCT`.  

---

## How to Use  

1. Download this repository as a ZIP file.  
2. Extract the ZIP file on your computer.  
3. Open **MySQL Workbench** (or any SQL client).  
4. Copy the queries from the `.sql` file.  
5. Run them step by step in this order:  
   - Create database and tables (DDL).  
   - Insert sample data (DML).  
   - Run queries (DQL).  

---

This version is **exactly upload-ready** for GitHub. It describes your Workbench file, explains what’s inside, gives instructions, and even sample queries.  


## 📝 Notes  
- Always run DDL before DML and DQL.  
- Drop or truncate tables before re-running inserts to avoid duplicates.  

## 👩‍💻 Author  
ThenDaarnika
