
mysql> use apnacollege;
Database changed
mysql> create table employee(id int primary key, name varchar(50), salary int);
Query OK, 0 rows affected (0.08 sec)

mysql> insert into employee values(1,"adam",50000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employee values(2,"bob",30000);
Query OK, 1 row affected (0.00 sec)

mysql> insert into employee values(3,"casey",40000);
Query OK, 1 row affected (0.00 sec)

mysql> select*from employee;
+----+-------+--------+
| id | name  | salary |
+----+-------+--------+
|  1 | adam  |  50000 |
|  2 | bob   |  30000 |
|  3 | casey |  40000 |
+----+-------+--------+
3 rows in set (0.02 sec)

mysql>