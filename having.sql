
-- HAVING is used to filter GROUPED data.
-- WHERE filters rows, HAVING filters groups.


-- Syntax
SELECT column_name, AGG_FUNCTION(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;



-- Imp
-- 1. WHERE is used before GROUP BY
-- 2. HAVING is used after GROUP BY
-- 3. Aggregate functions are NOT allowed in WHERE
-- 4. Aggregate functions ARE allowed in HAVING


-- Example 1: Total marks according to each grade
mysql> SELECT grade, SUM(marks)
    -> FROM student
    -> GROUP BY grade;
+-------+------------+
| grade | SUM(marks) |
+-------+------------+
| A     |        355 |
| B     |        151 |
| C     |        126 |
| D     |         55 |
| E     |         48 |
+-------+------------+
5 rows in set (0.00 sec)

 -- Example 2: Show grades where total marks > 150
mysql> SELECT grade, SUM(marks)
    -> FROM student
    -> GROUP BY grade
    -> HAVING SUM(marks) > 150;
+-------+------------+
| grade | SUM(marks) |
+-------+------------+
| A     |        355 |
| B     |        151 |
+-------+------------+
2 rows in set (0.00 sec)

mysql>

-- Example 3: Show grades having more than 2 students

mysql> SELECT grade, COUNT(*)
    -> FROM student
    -> GROUP BY grade
    -> HAVING COUNT(*) > 2;
+-------+----------+
| grade | COUNT(*) |
+-------+----------+
| A     |        4 |
+-------+----------+
1 row in set (0.00 sec)

mysql>

-- Example 4: Show grades with average marks >= 75
mysql> SELECT grade, AVG(marks)
    -> FROM student
    -> GROUP BY grade
    -> HAVING AVG(marks) >= 75;
+-------+------------+
| grade | AVG(marks) |
+-------+------------+
| A     |    88.7500 |
| B     |    75.5000 |
+-------+------------+
2 rows in set (0.00 sec)

mysql> select grade,count(rollno) from student group by grade having max(marks)<80;
+-------+---------------+
| grade | count(rollno) |
+-------+---------------+
| B     |             2 |
| C     |             2 |
| D     |             1 |
| E     |             1 |
+-------+---------------+
4 rows in set (0.00 sec)


mysql> select place from student where grade="A" group by place
    -> ;
+------------+
| place      |
+------------+
| Amritsar   |
| Chandigarh |
| Delhi      |
| Jaipur     |
+------------+
4 rows in set (0.00 sec)


mysql> select place from student where grade="A" group by place having max(marks)>90;
+------------+
| place      |
+------------+
| Chandigarh |
+------------+
1 row in set (0.00 sec)

mysql>



