
-- UPDATE is used to modify existing records in a table.

---

-- Basic Syntax

UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;


-- If WHERE is omitted, ALL rows will be updated.



-- Example 1: Update marks of a specific student
mysql> select*from student;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      1 | Aman   |    85 | A     | Delhi      |
|      2 | Riya   |    78 | B     | Mumbai     |
|      3 | Karan  |    92 | A     | Chandigarh |
|      4 | Sneha  |    66 | C     | Pune       |
|      5 | Rahul  |    55 | D     | Bhopal     |
|      6 | Neha   |    88 | A     | Jaipur     |
|      7 | Vikram |    73 | B     | Indore     |
|      8 | Pooja  |    60 | C     | Lucknow    |
|      9 | Ankit  |    48 | E     | Patna      |
|     10 | Simran |    90 | A     | Amritsar   |
+--------+--------+-------+-------+------------+
10 rows in set (0.00 sec)

mysql> UPDATE student
    -> SET marks = 90
    -> WHERE rollno = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from student;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      1 | Aman   |    90 | A     | Delhi      |
|      2 | Riya   |    78 | B     | Mumbai     |
|      3 | Karan  |    92 | A     | Chandigarh |
|      4 | Sneha  |    66 | C     | Pune       |
|      5 | Rahul  |    55 | D     | Bhopal     |
|      6 | Neha   |    88 | A     | Jaipur     |
|      7 | Vikram |    73 | B     | Indore     |
|      8 | Pooja  |    60 | C     | Lucknow    |
|      9 | Ankit  |    48 | E     | Patna      |
|     10 | Simran |    90 | A     | Amritsar   |
+--------+--------+-------+-------+------------+
10 rows in set (0.00 sec)

-- Example 2: Update grade of a student
mysql> UPDATE student
    -> SET marks = 90
    -> WHERE rollno = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from student;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      1 | Aman   |    90 | A     | Delhi      |
|      2 | Riya   |    78 | B     | Mumbai     |
|      3 | Karan  |    92 | A     | Chandigarh |
|      4 | Sneha  |    66 | C     | Pune       |
|      5 | Rahul  |    55 | D     | Bhopal     |
|      6 | Neha   |    88 | A     | Jaipur     |
|      7 | Vikram |    73 | B     | Indore     |
|      8 | Pooja  |    60 | C     | Lucknow    |
|      9 | Ankit  |    48 | E     | Patna      |
|     10 | Simran |    90 | A     | Amritsar   |
+--------+--------+-------+-------+------------+
10 rows in set (0.00 sec)

mysql> UPDATE student
    -> SET grade = 'A'
    -> WHERE rollno = 5;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select*from student;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      1 | Aman   |    90 | A     | Delhi      |
|      2 | Riya   |    78 | B     | Mumbai     |
|      3 | Karan  |    92 | A     | Chandigarh |
|      4 | Sneha  |    66 | C     | Pune       |
|      5 | Rahul  |    55 | A     | Bhopal     |
|      6 | Neha   |    88 | A     | Jaipur     |
|      7 | Vikram |    73 | B     | Indore     |
|      8 | Pooja  |    60 | C     | Lucknow    |
|      9 | Ankit  |    48 | E     | Patna      |
|     10 | Simran |    90 | A     | Amritsar   |
+--------+--------+-------+-------+------------+
10 rows in set (0.00 sec)

mysql>

-- Example 3: Increase marks of all students by 5
UPDATE student
SET marks = marks + 5;
mysql> select*from student;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      1 | Aman   |    95 | A     | Delhi      |
|      2 | Riya   |    83 | B     | Mumbai     |
|      3 | Karan  |    97 | A     | Chandigarh |
|      4 | Sneha  |    71 | C     | Pune       |
|      5 | Rahul  |    60 | A     | Bhopal     |
|      6 | Neha   |    93 | A     | Jaipur     |
|      7 | Vikram |    78 | B     | Indore     |
|      8 | Pooja  |    65 | C     | Lucknow    |
|      9 | Ankit  |    53 | E     | Patna      |
|     10 | Simran |    95 | A     | Amritsar   |
+--------+--------+-------+-------+------------+
10 rows in set (0.00 sec)
-- Example 4: Update multiple columns
UPDATE student
SET marks = 85, grade = 'B'
WHERE name = 'Rahul';

+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      1 | Aman   |    95 | A     | Delhi      |
|      2 | Riya   |    83 | B     | Mumbai     |
|      3 | Karan  |    97 | A     | Chandigarh |
|      4 | Sneha  |    71 | C     | Pune       |
|      5 | Rahul  |    85 | B     | Bhopal     |
|      6 | Neha   |    93 | A     | Jaipur     |
|      7 | Vikram |    78 | B     | Indore     |
|      8 | Pooja  |    65 | C     | Lucknow    |
|      9 | Ankit  |    53 | E     | Patna      |
|     10 | Simran |    95 | A     | Amritsar   |
+--------+--------+-------+-------+------------+
10 rows in set (0.00 sec)

-- Example 5: Update using condition
UPDATE student
SET grade = 'A'
WHERE marks >= 85;

+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      1 | Aman   |    95 | A     | Delhi      |
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


-- UPDATE with LIMIT 

---

UPDATE student
SET marks = 0
LIMIT 1;

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

-- 1. Always use WHERE unless updating all rows
-- 2. UPDATE changes data permanently
-- 3. Can update one or multiple columns

