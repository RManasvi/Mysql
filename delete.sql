-- DELETE is used to remove existing records (rows) from a table.



-- Basic Syntax


DELETE FROM table_name
WHERE condition;


-- If WHERE clause is NOT used, ALL rows will be deleted.

---

-- Example Table: student
-- Columns: rollno, name, marks, grade

---
mysql> select*from student;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      1 | Aman   |     0 | A     | Delhi      |
|      2 | Riya   |    83 | B     | Mumbai     |
|      3 | Karan  |    97 | A     | Chandigarh |
|      4 | Sneha  |    71 | C     | Pune       |
|      5 | Rahul  |    85 | A     | Bhopal     |
|      6 | Neha   |    93 | A     | Jaipur     |
|      7 | Vikram |    78 | B     | Indore     |
|      8 | Pooja  |    65 | C     | Lucknow    |
|      9 | Ankit  |    53 | E     | Patna      |
|     10 | Simran |    95 | A     | Amritsar   |
+--------+--------+-------+-------+------------+
10 rows in set (0.01 sec)
-- Example 1: Delete a specific student record
mysql> -- Example 1: Delete a specific student record
mysql> DELETE FROM student
    -> WHERE rollno = 101;
Query OK, 0 rows affected (0.00 sec)

mysql>
mysql> -- Example 2: Delete students with marks less than 40
mysql> DELETE FROM student
    -> WHERE marks < 40;
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> -- Example 3: Delete students of a particular grade
mysql> DELETE FROM student
    -> WHERE grade = 'E';
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> -- Example 4: Delete all records from table (structure remains)
mysql> DELETE FROM student;
Query OK, 8 rows affected (0.00 sec)

mysql>
mysql> ---
    ->
    -> -- DELETE with LIMIT (MySQL specific)
    ->
    -> ---
    ->
    -> DELETE FROM student
    -> LIMIT 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-



-

DELETE FROM student
LIMIT 1' at line 1
mysql> select*from student;
Empty set (0.00 sec)

--=================================================
mysql> select*from students;
+--------+---------+
| rollno | name    |
+--------+---------+
|      1 | anshika |
|      2 | bhavya  |
|      3 | deepak  |
|      4 | manasvi |
+--------+---------+
4 rows in set (0.01 sec)

mysql> DELETE FROM students
    -> LIMIT 1;
Query OK, 0 rows affected (0.00 sec)


mysql> select*from students;
+--------+---------+
| rollno | name    |
+--------+---------+
|      2 | bhavya  |
|      3 | deepak  |
|      4 | manasvi |
+--------+---------+
3 rows in set (0.00 sec)

mysql>

---

-- DELETE vs TRUNCATE (Exam Favorite)

---

-- DELETE :
-- - DML command
-- - Can use WHERE clause
-- - Can be rolled back (if transaction used)

-- TRUNCATE :
-- - DDL command
-- - Cannot use WHERE clause
-- - Faster than DELETE
-- - Cannot be rolled back

---

-- Exam Tips

---

-- 1. Always use WHERE to avoid deleting all rows
-- 2. DELETE removes rows, not table structure
-- 3. Use TRUNCATE to remove all records quickly

---
