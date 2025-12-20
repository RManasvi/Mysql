--FULL JOIN (FULL OUTER JOIN) ->UNION 

-- combine the result of two or more SELECT queries into a single result set.

-- SELECT column_list FROM table1
-- UNION
-- SELECT column_list FROM table2;

| Rule No. | Condition                                |
| -------- | ---------------------------------------- |
| 1        | Number of columns must be same           |
| 2        | Data types of columns must be compatible |
| 3        | Order of columns must be same            |
| 4        | Column names taken from first SELECT     |



| Feature        | UNION              | UNION ALL       |
| -------------- | ------------------ | --------------- |
| Duplicate rows | Removed            | Kept            |
| Speed          | Slower             | Faster          |
| Use case       | Unique data needed | All data needed |



mysql> SELECT t.tid, t.namet, c.name AS course_name
    -> FROM teacher t
    -> LEFT JOIN course c
    -> ON t.course_id = c.id
    -> UNION
    -> SELECT t.tid, t.namet, c.name AS course_name
    -> FROM teacher t
    -> RIGHT JOIN course c
    -> ON t.course_id = c.id;
+------+--------+-------------+
| tid  | namet  | course_name |
+------+--------+-------------+
|  103 | Rahul  | DS          |
|  108 | Kavita | DS          |
|  104 | Pooja  | IOT         |
|  109 | Mohit  | IOT         |
|  105 | Ankit  | IT          |
|  110 | Sneha  | IT          |
|  102 | Neha   | AI          |
|  107 | Suresh | AI          |
+------+--------+-------------+
8 rows in set (0.00 sec)

mysql>



-- UNION
mysql> SELECT name AS course_name
    -> FROM course
    -> UNION
    -> SELECT c.name
    -> FROM teacher t
    -> JOIN course c
    -> ON t.course_id = c.id;
+-------------+
| course_name |
+-------------+
| DS          |
| IOT         |
| IT          |
| AI          |
+-------------+
4 rows in set (0.00 sec)



-- UNION ALL
mysql> SELECT name AS course_name
    -> FROM course
    -> UNION ALL
    -> SELECT c.name
    -> FROM teacher t
    -> JOIN course c
    -> ON t.course_id = c.id;
+-------------+
| course_name |
+-------------+
| DS          |
| IOT         |
| IT          |
| AI          |
| DS          |
| DS          |
| IOT         |
| IOT         |
| IT          |
| IT          |
| AI          |
| AI          |
+-------------+
12 rows in set (0.00 sec)

-- Keeps duplicate values
-- Faster than UNION


| Feature            | UNION         | JOIN          |
| ------------------ | ------------- | ------------- |
| Combines           | Rows          | Columns       |
| Common column      | Not required  | Required      |
| Duplicate handling | UNION removes | JOIN keeps    |
| Use case           | Merge results | Relate tables |



