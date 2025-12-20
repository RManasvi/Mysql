-- A subquery (or inner query) is a query inside another query. It’s used to calculate a value or return a set of rows that the main (outer) query can use.

-- Also called: Nested query

-- Purpose: Filter, compare, or derive results dynamically.

SELECT column1, column2
FROM table1
WHERE column3 operator (SELECT columnX FROM table2 WHERE condition);


| Type                      | Description                                                          |
| ------------------------- | -------------------------------------------------------------------- |
| Single-row subquery       | Returns  one value. Used with `=`, `>`, `<`.                      |
| Multiple-row subquery     | Returns multiple values. Used with `IN`, `ANY`, `ALL`.           |
| Correlated subquery       | Inner query depends on outer query. Executes once per outer row. |


a) Single-row subquery

Find the manager with the highest dept_id:


mysql> SELECT mgr_name, dept_id
    -> FROM manager
    -> WHERE dept_id = (SELECT MAX(dept_id) FROM manager);
+----------+---------+
| mgr_name | dept_id |
+----------+---------+
| David    |       5 |
+----------+---------+
1 row in set (0.01 sec)

b) Multiple-row subquery

Find all managers working in departments that exist in the department table:
mysql> SELECT mgr_name, dept_id
    -> FROM manager
    -> WHERE dept_id IN (SELECT dept_id FROM department);
+----------+---------+
| mgr_name | dept_id |
+----------+---------+
| David    |       5 |
+----------+---------+
1 row in set (0.00 sec)



c) Correlated subquery

Find managers whose dept_id is greater than the average dept_id of their table:

mysql> SELECT mgr_name, dept_id
    -> FROM manager m1
    -> WHERE dept_id > (SELECT AVG(dept_id) FROM manager m2);
Empty set (0.00 sec)




==================================================

A VIEW is a virtual table based on the result of a SQL query.

It does not store data physically (except in some cases like materialized views).

It acts like a stored SELECT query that you can reuse.

Use cases:

Simplify complex queries

Secure sensitive data (hide columns)

Reuse queries easily


CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;


-- View 
mysql> CREATE VIEW teacher_courses AS
    -> SELECT t.tid, t.namet, c.name AS course_name
    -> FROM teacher t
    -> JOIN course c
    -> ON t.course_id = c.id;
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> SELECT * FROM teacher_courses;
+-----+--------+-------------+
| tid | namet  | course_name |
+-----+--------+-------------+
| 102 | Neha   | AI          |
| 103 | Rahul  | DS          |
| 104 | Pooja  | IOT         |
| 105 | Ankit  | IT          |
| 107 | Suresh | AI          |
| 108 | Kavita | DS          |
| 109 | Mohit  | IOT         |
| 110 | Sneha  | IT          |
| 111 | Rohit  | AI          |
+-----+--------+-------------+
9 rows in set (0.01 sec)

-- mysql>
-- View with Condition
mysql> CREATE VIEW teacher_high_courses AS
    -> SELECT t.tid, t.namet, c.name AS course_name
    -> FROM teacher t
    -> JOIN course c
    -> ON t.course_id = c.id
    -> WHERE c.id > 2;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM teacher_high_courses;
+-----+--------+-------------+
| tid | namet  | course_name |
+-----+--------+-------------+
| 102 | Neha   | AI          |
| 103 | Rahul  | DS          |
| 104 | Pooja  | IOT         |
| 105 | Ankit  | IT          |
| 107 | Suresh | AI          |
| 108 | Kavita | DS          |
| 109 | Mohit  | IOT         |
| 110 | Sneha  | IT          |
| 111 | Rohit  | AI          |
+-----+--------+-------------+
9 rows in set (0.00 sec)

mysql>