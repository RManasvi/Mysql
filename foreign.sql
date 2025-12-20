-- Foreign Key is a column in one table that refers to the Primary Key of another table.
-- It is used to maintain relationship & data integrity between tables.


-- Parent Table (Referenced table)
-- CREATE TABLE course (
--     id INT PRIMARY KEY,
--     name VARCHAR(50)
-- );


-- id → Primary Key

-- This table is the PARENT TABLE

--  Child Table (Referencing table)

-- CREATE TABLE teacher (
--     tid INT PRIMARY KEY,
--     namet VARCHAR(69),
--     course_id INT,
--     FOREIGN KEY (course_id) REFERENCES course(id)
-- );


-- course_id → Foreign Key

-- References course(id)

-- This table is the CHILD TABLE

-- Why Foreign Key is Needed?

-- ✔ Ensures valid data
-- ✔ Prevents invalid entries
-- ✔ Maintains referential integrity

-- Example  (NOT allowed):

-- INSERT INTO teacher VALUES (111, "Rohit", 10);

-- IT WILL GIVE ERROR BECAUSE course_id 10 DOES NOT EXIST IN course TABLE.

mysql> INSERT INTO course VALUES
    -> (1, "CSE"),
    -> (2, "AI"),
    -> (3, "DS"),
    -> (4, "IOT"),
    -> (5, "IT");
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0


mysql> INSERT INTO teacher (tid, namet, course_id) VALUES
    -> (101, "Amit", 1),
    -> (102, "Neha", 2),
    -> (103, "Rahul", 3),
    -> (104, "Pooja", 4),
    -> (105, "Ankit", 5),
    -> (106, "Riya", 1),
    -> (107, "Suresh", 2),
    -> (108, "Kavita", 3),
    -> (109, "Mohit", 4),
    -> (110, "Sneha", 5);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT*FROM COURSE;
+----+------+
| id | name |
+----+------+
|  1 | CSE  |
|  2 | AI   |
|  3 | DS   |
|  4 | IOT  |
|  5 | IT   |
+----+------+
5 rows in set (0.00 sec)

mysql> SELECT*FROM TEACHER;
+-----+--------+-----------+
| tid | namet  | course_id |
+-----+--------+-----------+
| 101 | Amit   |         1 |
| 102 | Neha   |         2 |
| 103 | Rahul  |         3 |
| 104 | Pooja  |         4 |
| 105 | Ankit  |         5 |
| 106 | Riya   |         1 |
| 107 | Suresh |         2 |
| 108 | Kavita |         3 |
| 109 | Mohit  |         4 |
| 110 | Sneha  |         5 |
+-----+--------+-----------+
10 rows in set (0.00 sec)



--  Correct relation
--  Uses foreign key
--  Meaningful output




-- Foreign Key is a field in one table that refers to the Primary Key of another table to maintain referential integrity.

-- Parent table → Primary Key
-- Child table → Foreign Key
-- Insert parent data first
-- Use JOIN ... ON for correct result
-- Prevents invalid data