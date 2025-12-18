-- to define some condition

mysql> select * from student where marks>80;
+--------+--------+-------+-------+------------+
| rollno | name   | marks | grade | place      |
+--------+--------+-------+-------+------------+
|      1 | Aman   |    85 | A     | Delhi      |
|      3 | Karan  |    92 | A     | Chandigarh |
|      6 | Neha   |    88 | A     | Jaipur     |
|     10 | Simran |    90 | A     | Amritsar   |
+--------+--------+-------+-------+------------+
4 rows in set (0.01 sec)



-- ==================================================================================================
-- | Operator    | Meaning              | Example                      | Explanation        |
-- | ----------- | -------------------- | ---------------------------- | ------------------ |
-- | `=`         | Equal to             | `marks = 80`                 | Marks exactly 80   |
-- | `!=` / `<>` | Not equal to         | `grade != 'A'`               | Grade not A        |
-- | `>`         | Greater than         | `marks > 70`                 | Marks more than 70 |
-- | `<`         | Less than            | `marks < 50`                 | Marks less than 50 |
-- | `>=`        | Greater or equal     | `marks >= 60`                | Marks 60 or more   |
-- | `<=`        | Less or equal        | `marks <= 40`                | Marks 40 or less   |
-- | `AND`       | Both conditions true | `marks > 60 AND grade = 'A'` | High scorer with A |
-- | `OR`        | Any one true         | `grade = 'A' OR grade = 'B'` | A or B grade       |
-- | `NOT`       | Opposite condition   | `NOT grade = 'C'`            | Not grade C        |
-- | `IN`        | Multiple values      | `place IN ('Delhi','Pune')`  | Delhi or Pune      |
-- | `NOT IN`    | Excludes values      | `grade NOT IN ('D','E')`     | Not D or E         |
-- | `BETWEEN`   | Range                | `marks BETWEEN 60 AND 80`    | 60 to 80           |
-- | `LIKE`      | Pattern match        | `name LIKE 'A%'`             | Starts with A      |
-- | `IS NULL`   | Null value           | `marks IS NULL`              | Marks missing      |
-- ==================================================================================================



/* ============================================
   WHERE CLAUSE OPERATORS 
   ============================================ */


CREATE TABLE student (
    rollno INT,
    name VARCHAR(50),
    marks INT,
    grade CHAR(1),
    place VARCHAR(30)
);

------------------------------------------------
-- 1. ARITHMETIC OPERATORS
-- Used for mathematical calculations
------------------------------------------------

-- Addition
SELECT name, marks + 5 AS increased_marks FROM student;

-- Subtraction
SELECT name, marks - 10 AS reduced_marks FROM student;

-- Multiplication
SELECT name, marks * 2 AS double_marks FROM student;

-- Division
SELECT name, marks / 2 AS half_marks FROM student;

-- Modulus (remainder)
SELECT name, marks % 2 AS remainder FROM student;

------------------------------------------------
-- 2. COMPARISON (RELATIONAL) OPERATORS
-- Used to compare values
------------------------------------------------

-- Equal to
SELECT * FROM student WHERE marks = 90;

-- Not equal to
SELECT * FROM student WHERE grade != 'A';

-- Greater than
SELECT * FROM student WHERE marks > 60;

-- Less than
SELECT * FROM student WHERE marks < 50;

-- Greater than or equal to
SELECT * FROM student WHERE marks >= 75;

-- Less than or equal to
SELECT * FROM student WHERE marks <= 40;

-- BETWEEN operator
SELECT * FROM student WHERE marks BETWEEN 60 AND 80;

-- IN operator
SELECT * FROM student WHERE place IN ('Delhi', 'Pune');

-- LIKE operator (pattern matching)
SELECT * FROM student WHERE name LIKE 'A%';

------------------------------------------------
-- 3. LOGICAL OPERATORS
-- Used to combine conditions
------------------------------------------------

-- AND operator
SELECT * FROM student
WHERE marks > 60 AND grade = 'A';

-- OR operator
SELECT * FROM student
WHERE grade = 'A' OR grade = 'B';

-- NOT operator
SELECT * FROM student
WHERE NOT grade = 'C';

------------------------------------------------
-- 4. BITWISE OPERATORS
-- Used on binary numbers
------------------------------------------------

-- Bitwise AND
SELECT 5 & 3 AS bitwise_and;

-- Bitwise OR
SELECT 5 | 3 AS bitwise_or;

-- Bitwise XOR
SELECT 5 ^ 3 AS bitwise_xor;

-- Bitwise NOT
SELECT ~5 AS bitwise_not;

-- Left Shift
SELECT 5 << 1 AS left_shift;

-- Right Shift
SELECT 5 >> 1 AS right_shift;


-- no error if element not found
mysql> select name,place from student where place in ("Dubai", "delhi")
    -> ;
+------+-------+
| name | place |
+------+-------+
| Aman | Delhi |
+------+-------+
1 row in set (0.00 sec)
