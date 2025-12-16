-- schema.sql
CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(100)
);

-- ================================================================================
-- APNA COLLEGE
-- ================================================================================

mysql> create database apnacollege;
Query OK, 1 row affected (0.02 sec)

mysql> use apnacollege
Database changed
mysql> create table student(id int primary key, name varchar(50), age int not null);
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO STUDENT VALUES(1,"MANASVI",21);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO STUDENT VALUES(2,"ANSHIKA",20);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT*FROM STUDENT;
+----+---------+-----+
| id | name    | age |
+----+---------+-----+
|  1 | MANASVI |  21 |
|  2 | ANSHIKA |  20 |
+----+---------+-----+
2 rows in set (0.01 sec)

mysql>