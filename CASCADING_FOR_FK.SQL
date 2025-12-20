Cascading means that when a change happens in the parent table, the same change automatically applies to the related records in the child table.

TYPES:-
| Action                | Meaning                          |
| --------------------- | -------------------------------- |
| ON DELETE CASCADE     | Deletes child rows automatically |
| ON UPDATE CASCADE     | Updates child rows automatically |




CREATE TABLE teacher (
    tid INT PRIMARY KEY,
    namet VARCHAR(69),
    course_id INT,
    FOREIGN KEY (course_id)
    REFERENCES course(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);





-- MAKE NEW TABLE WITH CASCADING FEATURE

mysql> DROP TABLE teacher;
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE teacher(
    ->     tid INT PRIMARY KEY,
    ->     namet VARCHAR(69),
    ->     course_id INT,
    ->     FOREIGN KEY (course_id)
    ->     REFERENCES course(id)
    ->     ON DELETE CASCADE
    ->     ON UPDATE CASCADE
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO teacher (tid, namet, course_id) VALUES
    ->     -> (101, "Amit", 1),
    ->     -> (102, "Neha", 2),
    ->     -> (103, "Rahul", 3),
    ->     -> (104, "Pooja", 4),
    ->     -> (105, "Ankit", 5),
    ->     -> (106, "Riya", 1),
    ->     -> (107, "Suresh", 2),
    ->     -> (108, "Kavita", 3),
    ->     -> (109, "Mohit", 4),
    ->     -> (110, "Sneha", 5);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> (101, "Amit", 1),
    -> (102, "Neha", 2),
    -> (103, "Rahul", 3),
    -> (' at line 2
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

mysql> SELECT * FROM teacher;
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

mysql> DELETE FROM course WHERE id = 1;
Query OK, 1 row affected (0.04 sec)

mysql> SELECT*FROM COURSE;
+----+------+
| id | name |
+----+------+
|  2 | AI   |
|  3 | DS   |
|  4 | IOT  |
|  5 | IT   |
+----+------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM teacher;
+-----+--------+-----------+
| tid | namet  | course_id |
+-----+--------+-----------+
| 102 | Neha   |         2 |
| 103 | Rahul  |         3 |
| 104 | Pooja  |         4 |
| 105 | Ankit  |         5 |
| 107 | Suresh |         2 |
| 108 | Kavita |         3 |
| 109 | Mohit  |         4 |
| 110 | Sneha  |         5 |
+-----+--------+-----------+
8 rows in set (0.00 sec)



-- =================================================

-- UPDATE
mysql> UPDATE course SET id = 20 WHERE id = 2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM teacher;
+-----+--------+-----------+
| tid | namet  | course_id |
+-----+--------+-----------+
| 102 | Neha   |        20 |
| 103 | Rahul  |         3 |
| 104 | Pooja  |         4 |
| 105 | Ankit  |         5 |
| 107 | Suresh |        20 |
| 108 | Kavita |         3 |
| 109 | Mohit  |         4 |
| 110 | Sneha  |         5 |
+-----+--------+-----------+
8 rows in set (0.00 sec)

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