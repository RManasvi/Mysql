-- write the query to find the avg marks in city in ascending order

mysql> select place,avg(marks) from student group by place;
+------------+------------+
| place      | avg(marks) |
+------------+------------+
| Amritsar   |    90.0000 |
| Bhopal     |    55.0000 |
| Chandigarh |    92.0000 |
| Delhi      |    85.0000 |
| Indore     |    73.0000 |
| Jaipur     |    88.0000 |
| Lucknow    |    60.0000 |
| Mumbai     |    78.0000 |
| Patna      |    48.0000 |
| Pune       |    66.0000 |
+------------+------------+
10 rows in set (0.00 sec)

mysql> select place,avg(marks) from student group by place order by place;
+------------+------------+
| place      | avg(marks) |
+------------+------------+
| Amritsar   |    90.0000 |
| Bhopal     |    55.0000 |
| Chandigarh |    92.0000 |
| Delhi      |    85.0000 |
| Indore     |    73.0000 |
| Jaipur     |    88.0000 |
| Lucknow    |    60.0000 |
| Mumbai     |    78.0000 |
| Patna      |    48.0000 |
| Pune       |    66.0000 |
+------------+------------+
10 rows in set (0.00 sec)

mysql> select place,avg(marks) from student group by place order by place desc;
+------------+------------+
| place      | avg(marks) |
+------------+------------+
| Pune       |    66.0000 |
| Patna      |    48.0000 |
| Mumbai     |    78.0000 |
| Lucknow    |    60.0000 |
| Jaipur     |    88.0000 |
| Indore     |    73.0000 |
| Delhi      |    85.0000 |
| Chandigarh |    92.0000 |
| Bhopal     |    55.0000 |
| Amritsar   |    90.0000 |
+------------+------------+
10 rows in set (0.00 sec)



--======================================================================================================

-- for the given tanle, find the total payment according to each payment method

mysql> CREATE TABLE customer (
    ->     customer_id INT PRIMARY KEY,
    ->     customer VARCHAR(50),
    ->     mode VARCHAR(20),
    ->     city VARCHAR(30),
    ->     amount INT
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> INSERT INTO customer VALUES
    -> (101,'Olivia Barrett','Netbanking','Portland',5000),
    -> (102,'Ethan Sinclair','Credit Card','Miami',7000),
    -> (103,'Maya Hernandez','Credit Card','Seattle',6500),
    -> (104,'Liam Donovan','Netbanking','Denver',8000),
    -> (105,'Sophia Nguyen','Credit Card','New Orleans',7200),
    -> (106,'Caleb Foster','Debit Card','Minneapolis',6000),
    -> (107,'Ava Patel','Debit Card','Phoenix',5500),
    -> (108,'Lucas Carter','Netbanking','Boston',9000),
    -> (109,'Isabella Martinez','Netbanking','Nashville',6200),
    -> (110,'Jackson Brooks','Credit Card','Boston',7500);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select*from customer;
+-------------+-------------------+-------------+-------------+--------+
| customer_id | customer          | mode        | city        | amount |
+-------------+-------------------+-------------+-------------+--------+
|         101 | Olivia Barrett    | Netbanking  | Portland    |   5000 |
|         102 | Ethan Sinclair    | Credit Card | Miami       |   7000 |
|         103 | Maya Hernandez    | Credit Card | Seattle     |   6500 |
|         104 | Liam Donovan      | Netbanking  | Denver      |   8000 |
|         105 | Sophia Nguyen     | Credit Card | New Orleans |   7200 |
|         106 | Caleb Foster      | Debit Card  | Minneapolis |   6000 |
|         107 | Ava Patel         | Debit Card  | Phoenix     |   5500 |
|         108 | Lucas Carter      | Netbanking  | Boston      |   9000 |
|         109 | Isabella Martinez | Netbanking  | Nashville   |   6200 |
|         110 | Jackson Brooks    | Credit Card | Boston      |   7500 |
+-------------+-------------------+-------------+-------------+--------+
10 rows in set (0.00 sec)

mysql> select mode,sum(amount) from customer group by mode;
+-------------+-------------+
| mode        | sum(amount) |
+-------------+-------------+
| Credit Card |       28200 |
| Debit Card  |       11500 |
| Netbanking  |       28200 |
+-------------+-------------+
3 rows in set (0.00 sec)

mysql> select mode,count(customer) from customer group by mode;
+-------------+-----------------+
| mode        | count(customer) |
+-------------+-----------------+
| Credit Card |               4 |
| Debit Card  |               2 |
| Netbanking  |               4 |
+-------------+-----------------+
3 rows in set (0.00 sec)

--======================================================================================================

-- write the query to find the total marks according to each grade

mysql> select grade,sum(marks) from student group by grade;
+-------+------------+
| grade | sum(marks) |
+-------+------------+
| A     |        355 |
| B     |        151 |
| C     |        126 |
| D     |         55 |
| E     |         48 |
+-------+------------+
5 rows in set (0.00 sec)

mysql> select grade,sum(marks) from student group by grade order by grade desc;
+-------+------------+
| grade | sum(marks) |
+-------+------------+
| E     |         48 |
| D     |         55 |
| C     |        126 |
| B     |        151 |
| A     |        355 |
+-------+------------+
5 rows in set (0.00 sec)


mysql> select*from student;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      1 | Aman   |    85 | A     | Delhi      |
|      2 | Riya   |    78 | B     | Mumbai     |
|      3 | Karan  |    92 | A     | Chandigarh |
|      4 | Sneha  |    66 | C     | Pune       |
|      5 | Rahul  |    55 | D     | Bhopal     |
|      6 | Neha   |    88 | A     | Jaipur     |
|      7 | Vikram |    73 | B     | Indore     |
|      8 | Pooja  |    60 | C     | Lucknow    |
|      9 | Ankit  |    48 | E     | Patna      |
|     10 | Simran |    90 | A     | Amritsar   |
+--------+--------+-------+-------+------------+
10 rows in set (0.00 sec)

mysql> select grade,count(name) from student group by grade;
+-------+-------------+
| grade | count(name) |
+-------+-------------+
| A     |           4 |
| B     |           2 |
| C     |           2 |
| D     |           1 |
| E     |           1 |
+-------+-------------+
5 rows in set (0.00 sec)