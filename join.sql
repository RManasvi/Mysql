-- A JOIN is used to combine rows from two or more tables based on a related column.


-- Types of SQL JOINS
-- 1. INNER JOIN

-- Returns only matching records from both tables.

-- Syntax
-- SELECT columns
-- FROM table1
-- INNER JOIN table2
-- ON table1.column = table2.column;

mysql> SELECT t.tid, t.namet, c.name
    -> FROM teacher t
    -> INNER JOIN course c
    -> ON t.course_id = c.id;
+-----+--------+------+
| tid | namet  | name |
+-----+--------+------+
| 102 | Neha   | AI   |
| 103 | Rahul  | DS   |
| 104 | Pooja  | IOT  |
| 105 | Ankit  | IT   |
| 107 | Suresh | AI   |
| 108 | Kavita | DS   |
| 109 | Mohit  | IOT  |
| 110 | Sneha  | IT   |
+-----+--------+------+
8 rows in set (0.03 sec)




-- 2. LEFT JOIN (LEFT OUTER JOIN)

-- Returns all records from left table and matching records from right table.
-- If no match → NULL.

-- Syntax
-- SELECT columns
-- FROM table1
-- LEFT JOIN table2
-- ON table1.column = table2.column;


mysql> SELECT t.tid, t.namet, c.name
    -> FROM teacher t
    -> LEFT JOIN course c
    -> ON t.course_id = c.id;
+-----+--------+------+
| tid | namet  | name |
+-----+--------+------+
| 103 | Rahul  | DS   |
| 108 | Kavita | DS   |
| 104 | Pooja  | IOT  |
| 109 | Mohit  | IOT  |
| 105 | Ankit  | IT   |
| 110 | Sneha  | IT   |
| 102 | Neha   | AI   |
| 107 | Suresh | AI   |
+-----+--------+------+
8 rows in set (0.00 sec)

-- 3. RIGHT JOIN (RIGHT OUTER JOIN)

-- Returns all records from right table and matching records from left table.
-- If no match → NULL.

-- Syntax
-- SELECT columns
-- FROM table1
-- RIGHT JOIN table2
-- ON table1.column = table2.column;

mysql> SELECT t.tid, t.namet, c.name
    -> FROM teacher t
    -> RIGHT JOIN course c
    -> ON t.course_id = c.id;
+------+--------+------+
| tid  | namet  | name |
+------+--------+------+
|  102 | Neha   | AI   |
|  103 | Rahul  | DS   |
|  104 | Pooja  | IOT  |
|  105 | Ankit  | IT   |
|  107 | Suresh | AI   |
|  108 | Kavita | DS   |
|  109 | Mohit  | IOT  |
|  110 | Sneha  | IT   |
+------+--------+------+
8 rows in set (0.00 sec)


-- 4. FULL JOIN (FULL OUTER JOIN)

-- Returns all records from both tables.
-- If no match → NULL.

-- Note -> MySQL does NOT support FULL JOIN directly


-- Alternative in MySQL


mysql> SELECT t.tid, t.namet, c.name
    -> FROM teacher t
    -> LEFT JOIN course c
    -> ON t.course_id = c.id
    -> UNION
    -> SELECT t.tid, t.namet, c.name
    -> FROM teacher t
    -> RIGHT JOIN course c
    -> ON t.course_id = c.id;
+------+--------+------+
| tid  | namet  | name |
+------+--------+------+
|  103 | Rahul  | DS   |
|  108 | Kavita | DS   |
|  104 | Pooja  | IOT  |
|  109 | Mohit  | IOT  |
|  105 | Ankit  | IT   |
|  110 | Sneha  | IT   |
|  102 | Neha   | AI   |
|  107 | Suresh | AI   |
+------+--------+------+
8 rows in set (0.02 sec)



-- 5. CROSS JOIN

-- Returns Cartesian product (all combinations).

-- Syntax
mysql> SELECT * FROM teacher, course;
+-----+--------+-----------+----+------+
| tid | namet  | course_id | id | name |
+-----+--------+-----------+----+------+
| 102 | Neha   |        20 |  3 | DS   |
| 102 | Neha   |        20 |  4 | IOT  |
| 102 | Neha   |        20 |  5 | IT   |
| 102 | Neha   |        20 | 20 | AI   |
| 103 | Rahul  |         3 |  3 | DS   |
| 103 | Rahul  |         3 |  4 | IOT  |
| 103 | Rahul  |         3 |  5 | IT   |
| 103 | Rahul  |         3 | 20 | AI   |
| 104 | Pooja  |         4 |  3 | DS   |
| 104 | Pooja  |         4 |  4 | IOT  |
| 104 | Pooja  |         4 |  5 | IT   |
| 104 | Pooja  |         4 | 20 | AI   |
| 105 | Ankit  |         5 |  3 | DS   |
| 105 | Ankit  |         5 |  4 | IOT  |
| 105 | Ankit  |         5 |  5 | IT   |
| 105 | Ankit  |         5 | 20 | AI   |
| 107 | Suresh |        20 |  3 | DS   |
| 107 | Suresh |        20 |  4 | IOT  |
| 107 | Suresh |        20 |  5 | IT   |
| 107 | Suresh |        20 | 20 | AI   |
| 108 | Kavita |         3 |  3 | DS   |
| 108 | Kavita |         3 |  4 | IOT  |
| 108 | Kavita |         3 |  5 | IT   |
| 108 | Kavita |         3 | 20 | AI   |
| 109 | Mohit  |         4 |  3 | DS   |
| 109 | Mohit  |         4 |  4 | IOT  |
| 109 | Mohit  |         4 |  5 | IT   |
| 109 | Mohit  |         4 | 20 | AI   |
| 110 | Sneha  |         5 |  3 | DS   |
| 110 | Sneha  |         5 |  4 | IOT  |
| 110 | Sneha  |         5 |  5 | IT   |
| 110 | Sneha  |         5 | 20 | AI   |
+-----+--------+-----------+----+------+
32 rows in set (0.00 sec)

mysql>


| JOIN Type  | Result                    |
| ---------- | ------------------------- |
| INNER JOIN | Only matching rows        |
| LEFT JOIN  | All left + matching right |
| RIGHT JOIN | All right + matching left |
| FULL JOIN  | All rows from both tables |
| CROSS JOIN | All possible combinations |



========================================================
EXCLUSIVE RIGHT AND LEFT OUTER JOIN
========================================================


Exclusive LEFT JOIN-NO COMMON. ONLY UNIQUE FROM LEFT.


mysql> SELECT m.mgr_id, m.mgr_name
    -> FROM manager m
    -> LEFT JOIN department d
    -> ON m.dept_id = d.dept_id
    -> WHERE d.dept_id IS NULL;
Empty set (0.00 sec)

Result: Empty set
-> All managers have a valid department, so there are no exclusive left rows

Exclusive RIGHT JOIN
mysql> SELECT d.dept_id, d.dept_name
    -> FROM manager m
    -> RIGHT JOIN department d
    -> ON m.dept_id = d.dept_id
    -> WHERE m.mgr_id IS NULL;
+---------+-----------+
| dept_id | dept_name |
+---------+-----------+
|       1 | HR        |
|       2 | IT        |
|       3 | Finance   |
|       4 | Marketing |
+---------+-----------+
4 rows in set (0.00 sec)

These departments do not have any manager assigned → exclusive right rows.'
========================================================
| Join Type  | Exclusive Rows Condition        | Meaning                        |
| ---------- | ------------------------------- | ------------------------------ |
| LEFT JOIN  | `WHERE right_table.col IS NULL` | Left table rows without match  |
| RIGHT JOIN | `WHERE left_table.col IS NULL`  | Right table rows without match |
========================================================




SELF JOIN
========================================================                    
A SELF JOIN is when a table is joined with itself.

Useful when you want to compare rows within the same table.

Syntax:

SELECT a.column1, b.column2
FROM table_name a
JOIN table_name b
ON a.some_column = b.some_column;


mysql> SELECT c1.id AS course1_id, c1.name AS course1,
    ->        c2.id AS course2_id, c2.name AS course2
    -> FROM course c1
    -> JOIN course c2
    -> ON c1.id <> c2.id; --course is not paired with itself.
+------------+---------+------------+---------+
| course1_id | course1 | course2_id | course2 |
+------------+---------+------------+---------+
|          4 | IOT     |          3 | DS      |
|          5 | IT      |          3 | DS      |
|         20 | AI      |          3 | DS      |
|          3 | DS      |          4 | IOT     |
|          5 | IT      |          4 | IOT     |
|         20 | AI      |          4 | IOT     |
|          3 | DS      |          5 | IT      |
|          4 | IOT     |          5 | IT      |
|         20 | AI      |          5 | IT      |
|          3 | DS      |         20 | AI      |
|          4 | IOT     |         20 | AI      |
|          5 | IT      |         20 | AI      |
+------------+---------+------------+---------+
12 rows in set (0.00 sec)

mysql> SELECT*FROM COURSE;
+----+------+
| id | name |
+----+------+
|  3 | DS   |
|  4 | IOT  |
|  5 | IT   |
| 20 | AI   |
+----+------+
4 rows in set (0.00 sec)

mysql>
