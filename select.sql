-- Create STUDENT table
CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    marks INT CHECK (marks BETWEEN 0 AND 100),
    grade CHAR(1),
    place VARCHAR(30)
);

-- Insert 10 records
INSERT INTO student VALUES
(1, 'Aman', 85, 'A', 'Delhi'),
(2, 'Riya', 78, 'B', 'Mumbai'),
(3, 'Karan', 92, 'A', 'Chandigarh'),
(4, 'Sneha', 66, 'C', 'Pune'),
(5, 'Rahul', 55, 'D', 'Bhopal'),
(6, 'Neha', 88, 'A', 'Jaipur'),
(7, 'Vikram', 73, 'B', 'Indore'),
(8, 'Pooja', 60, 'C', 'Lucknow'),
(9, 'Ankit', 48, 'E', 'Patna'),
(10, 'Simran', 90, 'A', 'Amritsar');


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
+--------+--------+-------+

mysql> select name,marks from student;
+--------+-------+
| name   | marks |
+--------+-------+
| Aman   |    85 |
| Riya   |    78 |
| Karan  |    92 |
| Sneha  |    66 |
| Rahul  |    55 |
| Neha   |    88 |
| Vikram |    73 |
| Pooja  |    60 |
| Ankit  |    48 |
| Simran |    90 |
+--------+-------+
10 rows in set (0.00 sec)


mysql> select distinct place from student;
+------------+
| place      |
+------------+
| Delhi      |
| Mumbai     |
| Chandigarh |
| Pune       |
| Bhopal     |
| Jaipur     |
| Indore     |
| Lucknow    |
| Patna      |
| Amritsar   |
+------------+
10 rows in set (0.01 sec)