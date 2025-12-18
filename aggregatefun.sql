-- Used to perform calculations on multiple rows and return one single value.
-- Mostly used with numeric columns.

| Function  | Purpose         |
| --------- | --------------- |
| `COUNT()` | Counts rows     |
| `SUM()`   | Total of values |
| `AVG()`   | Average value   |
| `MIN()`   | Smallest value  |
| `MAX()`   | Largest value   |





mysql> SELECT COUNT(*) FROM student;
+----------+
| COUNT(*) |
+----------+
|       10 |
+----------+
1 row in set (0.01 sec)

mysql> SELECT COUNT(distinct grade) FROM student;
+-----------------------+
| COUNT(distinct grade) |
+-----------------------+
|                     5 |
+-----------------------+
1 row in set (0.01 sec)

mysql> SELECT COUNT(*) FROM student WHERE marks > 60;
+----------+
| COUNT(*) |
+----------+
|        7 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(name) FROM student WHERE marks > 60;
+-------------+
| COUNT(name) |
+-------------+
|           7 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(marks) FROM student;
+------------+
| SUM(marks) |
+------------+
|        735 |
+------------+
1 row in set (0.01 sec)

mysql> SELECT AVG(marks) FROM student;
+------------+
| AVG(marks) |
+------------+
|    73.5000 |
+------------+
1 row in set (0.01 sec)

mysql> SELECT MAX(marks) FROM student;
+------------+
| MAX(marks) |
+------------+
|         92 |
+------------+
1 row in set (0.01 sec)

mysql> SELECT MIN(marks) FROM student;
+------------+
| MIN(marks) |
+------------+
|         48 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT MAX(marks) AS highest_marks FROM student;
+---------------+
| highest_marks |
+---------------+
|            92 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT AVG(marks)
    -> FROM student
    -> WHERE grade = 'A';
+------------+
| AVG(marks) |
+------------+
|    88.7500 |
+------------+
1 row in set (0.01 sec)

mysql>


-- Can Aggregate Functions be used with WHERE?
--  Directly → NO

-- Aggregate functions CANNOT be used directly in WHERE.

-- SELECT * FROM student
-- WHERE AVG(marks) > 60;-------- wrong


correct-
SELECT AVG(marks)
FROM student
WHERE grade = 'A';
+------------+
| AVG(marks) |
+------------+
|    88.7500 |
+------------+
1 row in set (0.00 sec)

