-- GROUP BY is used to group rows having the same value and apply aggregate functions on each group.

mysql> SELECT grade, COUNT(*) AS total_students
    -> FROM student
    -> GROUP BY grade;
+-------+----------------+
| grade | total_students |
+-------+----------------+
| A     |              4 |
| B     |              2 |
| C     |              2 |
| D     |              1 |
| E     |              1 |
+-------+----------------+
5 rows in set (0.01 sec)


mysql> SELECT grade, AVG(marks) AS avg_marks
    -> FROM student
    -> GROUP BY grade;
+-------+-----------+
| grade | avg_marks |
+-------+-----------+
| A     |   88.7500 |
| B     |   75.5000 |
| C     |   63.0000 |
| D     |   55.0000 |
| E     |   48.0000 |
+-------+-----------+
5 rows in set (0.00 sec)


mysql> SELECT grade, MAX(marks) AS highest
    -> FROM student
    -> GROUP BY grade;
+-------+---------+
| grade | highest |
+-------+---------+
| A     |      92 |
| B     |      78 |
| C     |      66 |
| D     |      55 |
| E     |      48 |
+-------+---------+
5 rows in set (0.00 sec)


mysql> SELECT grade, COUNT(*)
    -> FROM student
    -> WHERE marks > 60
    -> GROUP BY grade;
+-------+----------+
| grade | COUNT(*) |
+-------+----------+
| A     |        4 |
| B     |        2 |
| C     |        1 |
+-------+----------+
3 rows in set (0.00 sec)

mysql> SELECT grade, AVG(marks)
    -> FROM student
    -> GROUP BY grade
    -> HAVING AVG(marks) > 70;
+-------+------------+
| grade | AVG(marks) |
+-------+------------+
| A     |    88.7500 |
| B     |    75.5000 |
+-------+------------+
2 rows in set (0.00 sec)

mysql>  select grade , sum(marks) from student group by grade;
+-------+------------+
| grade | sum(marks) |
+-------+------------+
| A     |        355 |
| B     |        151 |
| C     |        126 |
| D     |         55 |
| E     |         48 |
+-------+------------+
5 rows in set (0.03 sec)