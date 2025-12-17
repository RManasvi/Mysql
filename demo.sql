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


mysql> create database apnacollege;
ERROR 1007 (HY000): Can't create database 'apnacollege'; database exists

mysql> create database if not exists apnacollege;
Query OK, 1 row affected, 1 warning (0.00 sec)



mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| apnacollege        |
| ayursetu           |
| ayursutra          |
| basics             |
| bookstore          |
| colleges           |
| collegess          |
| community          |
| customer           |
| doctor             |
| doctors            |
| emergency          |
| employee           |
| finance_bot        |
| hospital           |
| krishna_hospital   |
| mydatabase         |
| mysql              |
| performance_schema |
| practice           |
| sys                |
| task               |
+--------------------+
25 rows in set (0.09 sec)

mysql> show tables;
+-----------------------+
| Tables_in_apnacollege |
+-----------------------+
| student               |
+-----------------------+
1 row in set (0.01 sec)


-- ================================================================================
-- ================================================================================
-- SQL LANGUAGES COMMANDS
-- ================================================================================
-- | Type | Full Form                    | Purpose                                |
-- | ---- | ---------------------------- | -------------------------------------- |
-- | DDL  | Data Definition Language     | Defines structure of database & tables |
-- | DML  | Data Manipulation Language   | Manipulates data inside tables         |
-- | DQL  | Data Query Language          | Retrieves data                         |
-- | TCL  | Transaction Control Language | Manages transactions                   |
-- | DCL  | Data Control Language        | Controls access/permissions            |
-- ================================================================================


-- DDL (Data Definition Language)
| Command    | Use                                    |
| ---------- | -------------------------------------- |
| `CREATE`   | Create database/table                  |
| `ALTER`    | Modify table structure                 |
| `DROP`     | Delete table/database permanently      |
| `TRUNCATE` | Remove all records (structure remains) |
| `RENAME`   | Rename table                           |


-- Examples:

CREATE TABLE student(id INT, name VARCHAR(20));
ALTER TABLE student ADD age INT;
DROP TABLE student;
TRUNCATE TABLE student;
RENAME TABLE student TO students;


--  Exam Tip:
-- DDL commands auto-commit (cannot be rolled back).

--  DML (Data Manipulation Language)
| Command  | Use                    |
| -------- | ---------------------- |
| `INSERT` | Add new record         |
| `UPDATE` | Modify existing record |
| `DELETE` | Remove record          |


-- Examples:

INSERT INTO student VALUES(1, 'Aman');
UPDATE student SET name='Rahul' WHERE id=1;
DELETE FROM student WHERE id=1;


-- DML commands can be rolled back.

-- DQL (Data Query Language)
-- Command	Use
-- SELECT	Fetch data from table

-- Examples:

SELECT * FROM student;
SELECT name FROM student WHERE id=1;

-- WHERE, GROUP BY, HAVING, ORDER BY are used with SELECT.

--  TCL (Transaction Control Language)
| Command     | Use                |
| ----------- | ------------------ |
| `COMMIT`    | Save transaction   |
| `ROLLBACK`  | Undo transaction   |
| `SAVEPOINT` | Set rollback point |


-- Examples:

COMMIT;
ROLLBACK;
SAVEPOINT sp1;
ROLLBACK TO sp1;


--  Exam Tip:
-- Used mainly with DML commands.

--  DCL (Data Control Language)

| Command  | Use               |
| -------- | ----------------- |
| `GRANT`  | Give permission   |
| `REVOKE` | Remove permission |


-- Examples:

GRANT SELECT ON student TO user1;
REVOKE SELECT ON student FROM user1;

--  DIFFERENCE (VERY IMPORTANT)
| TRUNCATE         | DELETE        |
| ---------------- | ------------- |
| DDL              | DML           |
| Faster           | Slower        |
| Cannot rollback  | Can rollback  |
| Removes all rows | Can use WHERE |



-- MEMORY TRICK 

-- DDL → Design
-- DML → Modify
-- DQL → Query
-- TCL → Transaction
-- DCL → Control access

-- ================================================================================
-- ================================================================================


mysql> DROP TABLE STUDENT;
Query OK, 0 rows affected (0.07 sec)

mysql> create table if not exists students(rollno int primary key, name varchar(50));
Query OK, 0 rows affected (0.05 sec)

mysql> show tables;
+-----------------------+
| Tables_in_apnacollege |
+-----------------------+
| students              |
+-----------------------+
1 row in set (0.00 sec)

mysql> select*from students;
Empty set (0.00 sec)

mysql> create table if not exists students(rollno int primary key, name varchar(50));
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> insert into students values(1,"anshika");
Query OK, 1 row affected (0.01 sec)

mysql> insert into students values(3,"deepak");
Query OK, 1 row affected (0.00 sec)

mysql> insert into students values(4,"manasvi");
Query OK, 1 row affected (0.00 sec)