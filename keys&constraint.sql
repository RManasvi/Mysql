/* =====================================================
   MYSQL KEYS – EXAM FRIENDLY NOTES
   ===================================================== */

/* 
KEY:
- A key is used to identify records uniquely
- Helps maintain data integrity
- Improves searching and indexing
*/

/* =====================================================
1. PRIMARY KEY
===================================================== */
/*
- Uniquely identifies each record in a table
- Cannot contain NULL values
- Only ONE primary key per table
- Automatically creates a unique index
*/

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

/* Composite Primary Key */
CREATE TABLE marks (
    roll_no INT,
    subject VARCHAR(20),
    PRIMARY KEY (roll_no, subject)
);

/* =====================================================
2. FOREIGN KEY
===================================================== */
/*
- Creates a relationship between two tables
- Refers to PRIMARY KEY of another table
- Maintains referential integrity
*/

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES student(id)
);

/* =====================================================
3. UNIQUE KEY
===================================================== */
/*
- Ensures all values in a column are unique
- Allows only ONE NULL value
- Multiple UNIQUE keys allowed in a table
*/

CREATE TABLE users (
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(10)
);

/* =====================================================
4. CANDIDATE KEY
===================================================== */
/*
- A column that can become a PRIMARY KEY
- Table can have multiple candidate keys
*/

-- Example:
-- email, phone (both unique)
-- One chosen as PRIMARY KEY, others remain candidate keys

/* =====================================================
5. SUPER KEY
===================================================== */
/*
- A set of one or more columns
- Can uniquely identify a row
- May contain extra attributes
*/

-- Example:
-- (id)
-- (id, name)

/* =====================================================
6. ALTERNATE KEY
===================================================== */
/*
- Candidate key NOT chosen as primary key
*/

-- Example:
-- email chosen as alternate key
-- id chosen as primary key

/* =====================================================
7. COMPOSITE KEY
===================================================== */
/*
- Key formed using TWO or more columns
*/

CREATE TABLE attendance (
    student_id INT,
    date DATE,
    PRIMARY KEY (student_id, date)
);

/* =====================================================
8. INDEX KEY
===================================================== */
/*
- Used to speed up data retrieval
- Allows duplicate values
*/

CREATE INDEX idx_name ON student(name);

/* =====================================================
9. DEFAULT KEY
===================================================== */
/*
- Assigns default value to a column
*/

CREATE TABLE employee (
    status VARCHAR(10) DEFAULT 'Active'
);

/* =====================================================
KEY DIFFERENCE (EXAM SHORT POINT)
===================================================== */
/*
PRIMARY KEY : Unique + NOT NULL
UNIQUE KEY  : Unique + allows one NULL
FOREIGN KEY : Links two tables
INDEX       : Faster searching
*/




/* =====================================================
   MYSQL CONSTRAINTS – EXAM FRIENDLY NOTES
   ===================================================== */

/*
CONSTRAINT:
- A rule applied on table columns
- Ensures data accuracy and integrity
- Prevents invalid data insertion
*/

/* =====================================================
1. NOT NULL CONSTRAINT
===================================================== */
/*
- Column cannot have NULL value
*/

CREATE TABLE student (
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL
);

/* =====================================================
2. UNIQUE CONSTRAINT
===================================================== */
/*
- Ensures all values in a column are unique
- Allows only ONE NULL value
*/

CREATE TABLE users (
    email VARCHAR(100) UNIQUE
);

/* =====================================================
3. PRIMARY KEY CONSTRAINT
===================================================== */
/*
- Uniquely identifies each record
- Cannot be NULL
- Only one PRIMARY KEY per table
*/

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50)
);

/* =====================================================
4. FOREIGN KEY CONSTRAINT
===================================================== */
/*
- Links two tables
- Maintains referential integrity
- Refers to PRIMARY KEY of another table
*/

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

/* =====================================================
5. CHECK CONSTRAINT
===================================================== */
/*
- Restricts values based on a condition
*/

CREATE TABLE product (
    price INT CHECK (price > 0),
    quantity INT CHECK (quantity >= 1)
);

/* =====================================================
6. DEFAULT CONSTRAINT
===================================================== */
/*
- Assigns a default value if no value is given
*/

CREATE TABLE account (
    status VARCHAR(10) DEFAULT 'Active'
);

/* =====================================================
7. COMPOSITE CONSTRAINT
===================================================== */
/*
- Constraint applied on multiple columns
*/

CREATE TABLE marks (
    roll_no INT,
    subject VARCHAR(20),
    PRIMARY KEY (roll_no, subject)
);

/* =====================================================
8. DOMAIN CONSTRAINT
===================================================== */
/*
- Restricts type, range, or format of data
- Implemented using CHECK, NOT NULL, DEFAULT
*/

CREATE TABLE voter (
    age INT CHECK (age >= 18)
);

/* =====================================================
ADDING CONSTRAINT USING ALTER
===================================================== */

ALTER TABLE student
ADD CONSTRAINT uc_email UNIQUE (email);

ALTER TABLE orders
ADD CONSTRAINT fk_emp
FOREIGN KEY (emp_id) REFERENCES employee(emp_id);

/* =====================================================
DROPPING CONSTRAINT
===================================================== */

ALTER TABLE student DROP CONSTRAINT uc_email;

/* =====================================================
CONSTRAINTS vs KEYS (EXAM POINT)
===================================================== */
/*
CONSTRAINT : Rule applied on column(s)
KEY        : Used to identify records uniquely
*/

/* =====================================================
IMPORTANT EXAM ONE-LINERS
===================================================== */
/*
- PRIMARY KEY = UNIQUE + NOT NULL
- FOREIGN KEY prevents invalid references
- CHECK enforces conditions
- DEFAULT assigns automatic value
*/

-- ====================================================

mysql> use apnacollege;
Database changed
mysql> create table employee(id int primary key, name varchar(50), salary int);
Query OK, 0 rows affected (0.08 sec)

mysql> insert into employee values(1,"adam",50000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee values(2,"bob",30000);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employee values(3,"casey",40000);
Query OK, 1 row affected (0.00 sec)

mysql> select*from employee;
+----+-------+--------+
| id | name  | salary |
+----+-------+--------+
|  1 | adam  |  50000 |
|  2 | bob   |  30000 |
|  3 | casey |  40000 |
+----+-------+--------+
3 rows in set (0.02 sec)

mysql> select*from employee where salary > 30000;
+----+-------+--------+
| id | name  | salary |
+----+-------+--------+
|  1 | adam  |  50000 |
|  3 | casey |  40000 |
+----+-------+--------+
2 rows in set (0.11 sec)

mysql> INSERT INTO employee VALUES (4, "david", 55000);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO employee VALUES (5, "eva", 47000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES (6, "frank", 60000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES (7, "grace", 52000);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO employee VALUES (8, "harry", 45000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES (9, "irene", 53000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES (10, "jack", 39000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES (11, "karen", 61000);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO employee VALUES (12, "leo", 47000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES (13, "maya", 58000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES (14, "nina", 50000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES (15, "oliver", 62000);
Query OK, 1 row affected (0.00 sec)

mysql> /* =====================================================
   /*>    SQL OPERATIONS ON EMPLOYEE TABLE
   /*>    ===================================================== */
mysql>
mysql> /* ========================
   /*> 1. SELECT OPERATION
   /*> ======================== */
mysql>
mysql> /* Display all records */
mysql> SELECT * FROM employee;
+----+--------+--------+
| id | name   | salary |
+----+--------+--------+
|  1 | adam   |  50000 |
|  2 | bob    |  30000 |
|  3 | casey  |  40000 |
|  4 | david  |  55000 |
|  5 | eva    |  47000 |
|  6 | frank  |  60000 |
|  7 | grace  |  52000 |
|  8 | harry  |  45000 |
|  9 | irene  |  53000 |
| 10 | jack   |  39000 |
| 11 | karen  |  61000 |
| 12 | leo    |  47000 |
| 13 | maya   |  58000 |
| 14 | nina   |  50000 |
| 15 | oliver |  62000 |
+----+--------+--------+
15 rows in set (0.00 sec)

mysql>
mysql> /* Display only name and salary */
mysql> SELECT name, salary FROM employee;
+--------+--------+
| name   | salary |
+--------+--------+
| adam   |  50000 |
| bob    |  30000 |
| casey  |  40000 |
| david  |  55000 |
| eva    |  47000 |
| frank  |  60000 |
| grace  |  52000 |
| harry  |  45000 |
| irene  |  53000 |
| jack   |  39000 |
| karen  |  61000 |
| leo    |  47000 |
| maya   |  58000 |
| nina   |  50000 |
| oliver |  62000 |
+--------+--------+
15 rows in set (0.00 sec)

mysql>
mysql> /* Display employees with salary > 50000 */
mysql> SELECT * FROM employee
    -> WHERE salary > 50000;
+----+--------+--------+
| id | name   | salary |
+----+--------+--------+
|  4 | david  |  55000 |
|  6 | frank  |  60000 |
|  7 | grace  |  52000 |
|  9 | irene  |  53000 |
| 11 | karen  |  61000 |
| 13 | maya   |  58000 |
| 15 | oliver |  62000 |
+----+--------+--------+
7 rows in set (0.00 sec)

mysql>
mysql> /* ========================
   /*> 2. UPDATE OPERATION
   /*> ======================== */
mysql>
mysql> /* Increase salary of employee with id = 3 */
mysql> UPDATE employee
    -> SET salary = 52000
    -> WHERE emp_id = 3;
ERROR 1054 (42S22): Unknown column 'emp_id' in 'where clause'
mysql>
mysql> /* Increase salary by 5000 where salary < 45000 */
mysql> UPDATE employee
    -> SET salary = salary + 5000
    -> WHERE salary < 45000;
Query OK, 3 rows affected (0.02 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql>
mysql> /* ========================
   /*> 3. DELETE OPERATION
   /*> ======================== */
mysql>
mysql> /* Delete employee with id = 10 */
mysql> DELETE FROM employee
    -> WHERE emp_id = 10;
ERROR 1054 (42S22): Unknown column 'emp_id' in 'where clause'
mysql>
mysql> /* Delete employees with salary < 40000 */
mysql> DELETE FROM employee
    -> WHERE salary < 40000;
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> /* ========================
   /*> 4. AGGREGATE FUNCTIONS
   /*> ======================== */
mysql>
mysql> /* Find maximum salary */
mysql> SELECT MAX(salary) FROM employee;
+-------------+
| MAX(salary) |
+-------------+
|       62000 |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> /* Find minimum salary */
mysql> SELECT MIN(salary) FROM employee;
+-------------+
| MIN(salary) |
+-------------+
|       44000 |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> /* Find average salary */
mysql> SELECT AVG(salary) FROM employee;
+-------------+
| AVG(salary) |
+-------------+
|  52071.4286 |
+-------------+
1 row in set (0.00 sec)

mysql>
mysql> /* Count total employees */
mysql> SELECT COUNT(*) FROM employee;
+----------+
| COUNT(*) |
+----------+
|       14 |
+----------+
1 row in set (0.00 sec)

mysql>
mysql> /* ========================
   /*> 5. ORDER BY
   /*> ======================== */
mysql>
mysql> /* Sort employees by salary (ascending) */
mysql> SELECT * FROM employee
    -> ORDER BY salary;
+----+--------+--------+
| id | name   | salary |
+----+--------+--------+
| 10 | jack   |  44000 |
|  3 | casey  |  45000 |
|  8 | harry  |  45000 |
|  5 | eva    |  47000 |
| 12 | leo    |  47000 |
|  1 | adam   |  50000 |
| 14 | nina   |  50000 |
|  7 | grace  |  52000 |
|  9 | irene  |  53000 |
|  4 | david  |  55000 |
| 13 | maya   |  58000 |
|  6 | frank  |  60000 |
| 11 | karen  |  61000 |
| 15 | oliver |  62000 |
+----+--------+--------+
14 rows in set (0.00 sec)

mysql>
mysql> /* Sort employees by salary (descending) */
mysql> SELECT * FROM employee
    -> ORDER BY salary DESC;
+----+--------+--------+
| id | name   | salary |
+----+--------+--------+
| 15 | oliver |  62000 |
| 11 | karen  |  61000 |
|  6 | frank  |  60000 |
| 13 | maya   |  58000 |
|  4 | david  |  55000 |
|  9 | irene  |  53000 |
|  7 | grace  |  52000 |
|  1 | adam   |  50000 |
| 14 | nina   |  50000 |
|  5 | eva    |  47000 |
| 12 | leo    |  47000 |
|  3 | casey  |  45000 |
|  8 | harry  |  45000 |
| 10 | jack   |  44000 |
+----+--------+--------+
14 rows in set (0.00 sec)

mysql>
mysql> /* ========================
   /*> 6. LIMIT
   /*> ======================== */
mysql>
mysql> /* Display top 5 highest paid employees */
mysql> SELECT * FROM employee
    -> ORDER BY salary DESC
    -> LIMIT 5;
+----+--------+--------+
| id | name   | salary |
+----+--------+--------+
| 15 | oliver |  62000 |
| 11 | karen  |  61000 |
|  6 | frank  |  60000 |
| 13 | maya   |  58000 |
|  4 | david  |  55000 |
+----+--------+--------+
5 rows in set (0.00 sec)

mysql>
mysql> /* ========================
   /*> 7. LIKE OPERATOR
   /*> ======================== */
mysql>
mysql> /* Names starting with 'a' */
mysql> SELECT * FROM employee
    -> WHERE name LIKE 'a%';
+----+------+--------+
| id | name | salary |
+----+------+--------+
|  1 | adam |  50000 |
+----+------+--------+
1 row in set (0.00 sec)

mysql>
mysql> /* Names containing 'a' */
mysql> SELECT * FROM employee
    -> WHERE name LIKE '%a%';
+----+-------+--------+
| id | name  | salary |
+----+-------+--------+
|  1 | adam  |  50000 |
|  3 | casey |  45000 |
|  4 | david |  55000 |
|  5 | eva   |  47000 |
|  6 | frank |  60000 |
|  7 | grace |  52000 |
|  8 | harry |  45000 |
| 10 | jack  |  44000 |
| 11 | karen |  61000 |
| 13 | maya  |  58000 |
| 14 | nina  |  50000 |
+----+-------+--------+
11 rows in set (0.00 sec)

mysql>
mysql> /* ========================
   /*> 8. BETWEEN OPERATOR
   /*> ======================== */
mysql>
mysql> /* Salary between 45000 and 55000 */
mysql> SELECT * FROM employee
    -> WHERE salary BETWEEN 45000 AND 55000;
+----+-------+--------+
| id | name  | salary |
+----+-------+--------+
|  1 | adam  |  50000 |
|  3 | casey |  45000 |
|  4 | david |  55000 |
|  5 | eva   |  47000 |
|  7 | grace |  52000 |
|  8 | harry |  45000 |
|  9 | irene |  53000 |
| 12 | leo   |  47000 |
| 14 | nina  |  50000 |
+----+-------+--------+
9 rows in set (0.00 sec)

mysql>
mysql> /* ========================
   /*> 9. IN OPERATOR
   /*> ======================== */
mysql>
mysql> /* Employees with specific IDs */
mysql> SELECT * FROM employee
    -> WHERE emp_id IN (1, 3, 5, 7);
ERROR 1054 (42S22): Unknown column 'emp_id' in 'where clause'
mysql>
mysql> /* ========================
   /*> 10. ALIAS
   /*> ======================== */
mysql>
mysql> /* Rename column name in output */
mysql> SELECT name AS employee_name, salary AS monthly_salary
    -> FROM employee;
+---------------+----------------+
| employee_name | monthly_salary |
+---------------+----------------+
| adam          |          50000 |
| casey         |          45000 |
| david         |          55000 |
| eva           |          47000 |
| frank         |          60000 |
| grace         |          52000 |
| harry         |          45000 |
| irene         |          53000 |
| jack          |          44000 |
| karen         |          61000 |
| leo           |          47000 |
| maya          |          58000 |
| nina          |          50000 |
| oliver        |          62000 |
+---------------+----------------+
14 rows in set (0.00 sec)

mysql>