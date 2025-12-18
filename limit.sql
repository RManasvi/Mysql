-- Used to restrict number of rows returned in the result.

mysql> select*from student
    -> ;
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
10 rows in set (0.03 sec)

mysql> select*from student limit 3;
+--------+-------+-------+-------+------------+
| rollno | name  | marks | grade | place      |
+--------+-------+-------+-------+------------+
|      1 | Aman  |    85 | A     | Delhi      |
|      2 | Riya  |    78 | B     | Mumbai     |
|      3 | Karan |    92 | A     | Chandigarh |
+--------+-------+-------+-------+------------+
3 rows in set (0.00 sec)

mysql> select*from student where marks>90 limit 3;
+--------+-------+-------+-------+------------+
| rollno | name  | marks | grade | place      |
+--------+-------+-------+-------+------------+
|      3 | Karan |    92 | A     | Chandigarh |
+--------+-------+-------+-------+------------+
1 row in set (0.02 sec)

mysql> SELECT * FROM student
    -> ORDER BY marks ASC;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      9 | Ankit  |    48 | E     | Patna      |
|      5 | Rahul  |    55 | D     | Bhopal     |
|      8 | Pooja  |    60 | C     | Lucknow    |
|      4 | Sneha  |    66 | C     | Pune       |
|      7 | Vikram |    73 | B     | Indore     |
|      2 | Riya   |    78 | B     | Mumbai     |
|      1 | Aman   |    85 | A     | Delhi      |
|      6 | Neha   |    88 | A     | Jaipur     |
|     10 | Simran |    90 | A     | Amritsar   |
|      3 | Karan  |    92 | A     | Chandigarh |
+--------+--------+-------+-------+------------+
10 rows in set (0.02 sec)

mysql> SELECT * FROM student ORDER BY place ASC;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|     10 | Simran |    90 | A     | Amritsar   |
|      5 | Rahul  |    55 | D     | Bhopal     |
|      3 | Karan  |    92 | A     | Chandigarh |
|      1 | Aman   |    85 | A     | Delhi      |
|      7 | Vikram |    73 | B     | Indore     |
|      6 | Neha   |    88 | A     | Jaipur     |
|      8 | Pooja  |    60 | C     | Lucknow    |
|      2 | Riya   |    78 | B     | Mumbai     |
|      9 | Ankit  |    48 | E     | Patna      |
|      4 | Sneha  |    66 | C     | Pune       |
+--------+--------+-------+-------+------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM student ORDER BY place desc;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      4 | Sneha  |    66 | C     | Pune       |
|      9 | Ankit  |    48 | E     | Patna      |
|      2 | Riya   |    78 | B     | Mumbai     |
|      8 | Pooja  |    60 | C     | Lucknow    |
|      6 | Neha   |    88 | A     | Jaipur     |
|      7 | Vikram |    73 | B     | Indore     |
|      1 | Aman   |    85 | A     | Delhi      |
|      3 | Karan  |    92 | A     | Chandigarh |
|      5 | Rahul  |    55 | D     | Bhopal     |
|     10 | Simran |    90 | A     | Amritsar   |
+--------+--------+-------+-------+------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM student ORDER BY rollno desc;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|     10 | Simran |    90 | A     | Amritsar   |
|      9 | Ankit  |    48 | E     | Patna      |
|      8 | Pooja  |    60 | C     | Lucknow    |
|      7 | Vikram |    73 | B     | Indore     |
|      6 | Neha   |    88 | A     | Jaipur     |
|      5 | Rahul  |    55 | D     | Bhopal     |
|      4 | Sneha  |    66 | C     | Pune       |
|      3 | Karan  |    92 | A     | Chandigarh |
|      2 | Riya   |    78 | B     | Mumbai     |
|      1 | Aman   |    85 | A     | Delhi      |
+--------+--------+-------+-------+------------+
10 rows in set (0.00 sec)

mysql>