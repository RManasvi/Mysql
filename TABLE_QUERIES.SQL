-- alter(to change the schema)-> design change
-- DDL command used to modify the structure of an existing table.

--  It does NOT affect existing data (unless you drop a column).

mysql> ALTER TABLE students
    -> ADD age INT;
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0



-- ADD a new column
mysql> select*from students;
+--------+---------+------+
| rollno | name    | age  |
+--------+---------+------+
|      2 | bhavya  | NULL |
|      3 | deepak  | NULL |
|      4 | manasvi | NULL |
+--------+---------+------+
3 rows in set (0.00 sec)


ADD multiple columns

mysql> ALTER TABLE students
    -> ADD (city VARCHAR(30), marks INT);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select*from students;
+--------+---------+------+------+-------+
| rollno | name    | age  | city | marks |
+--------+---------+------+------+-------+
|      2 | bhavya  | NULL | NULL |  NULL |
|      3 | deepak  | NULL | NULL |  NULL |
|      4 | manasvi | NULL | NULL |  NULL |
+--------+---------+------+------+-------+
3 rows in set (0.01 sec)


-- MODIFY column (change datatype / size)

mysql> ALTER TABLE students
    -> MODIFY name VARCHAR(100);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select*from students;
+--------+---------+------+------+-------+
| rollno | name    | age  | city | marks |
+--------+---------+------+------+-------+
|      2 | bhavya  | NULL | NULL |  NULL |
|      3 | deepak  | NULL | NULL |  NULL |
|      4 | manasvi | NULL | NULL |  NULL |
+--------+---------+------+------+-------+
3 rows in set (0.00 sec)

CHANGE column name + datatype
mysql> ALTER TABLE students
    -> CHANGE name student_name VARCHAR(50);
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select*from students;
+--------+--------------+------+------+-------+
| rollno | student_name | age  | city | marks |
+--------+--------------+------+------+-------+
|      2 | bhavya       | NULL | NULL |  NULL |
|      3 | deepak       | NULL | NULL |  NULL |
|      4 | manasvi      | NULL | NULL |  NULL |
+--------+--------------+------+------+-------+
3 rows in set (0.02 sec)

-- DROP a column

mysql> ALTER TABLE students
    -> DROP age;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select*from students;
+--------+--------------+------+-------+
| rollno | student_name | city | marks |
+--------+--------------+------+-------+
|      2 | bhavya       | NULL |  NULL |
|      3 | deepak       | NULL |  NULL |
|      4 | manasvi      | NULL |  NULL |
+--------+--------------+------+-------+
3 rows in set (0.00 sec)


ALTER TABLE student
ADD PRIMARY KEY (rollno);


ALTER TABLE student
DROP PRIMARY KEY;


