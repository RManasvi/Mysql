

## 📋 Table of Contents

1. [Window Function kya hoti hai?](#1-window-function-kya-hoti-hai)
2. [Basic Syntax](#2-basic-syntax)
3. [Window Frame — PRECEDING & FOLLOWING](#3-window-frame--preceding--following)
4. [Ranking Functions](#4-ranking-functions)
5. [Aggregate as Window — SUM, AVG, COUNT](#5-aggregate-as-window-functions)
6. [LAG & LEAD](#6-lag--lead)
7. [FIRST\_VALUE & LAST\_VALUE](#7-first_value--last_value)
8. [NTILE](#8-ntile)
9. [PERCENT\_RANK & CUME\_DIST](#9-percent_rank--cume_dist)
10. [PARTITION BY — Deep Dive](#10-partition-by--deep-dive)
11. [5 Classic Interview Questions](#11-interview-questions)
12. [Cheatsheet](#12-cheatsheet)

---

## 1. Window Function kya hoti hai?

Window functions ek **set of rows** pe operate karti hain — lekin `GROUP BY` se alag, **rows collapse nahi hoti**. Har row apna result khud rakhti hai.

| Feature | GROUP BY | Window Function |
|---|---|---|
| Rows collapse hoti hain? | ✅ Haan | ❌ Nahi |
| Har row apna result rakhti hai? | ❌ Nahi | ✅ Haan |
| Kahan use hoti hai? | `SELECT`, `HAVING` | Sirf `SELECT` aur `ORDER BY` |

```sql
-- GROUP BY: sirf 1 row per dept
SELECT dept, SUM(salary)
FROM employees
GROUP BY dept;

-- Window Function: har employee ka row aata hai + dept total bhi
SELECT dept, salary,
  SUM(salary) OVER(PARTITION BY dept) AS dept_total
FROM employees;
```

> ⚠️ **Key Rule:** Window functions sirf `SELECT` aur `ORDER BY` mein use ho sakti hain — `WHERE` ya `GROUP BY` mein nahi.

---

## 2. Basic Syntax

```sql
function_name(expr) OVER (
  [PARTITION BY col1, col2]   -- optional: groups mein divide karo
  [ORDER BY col3 ASC|DESC]    -- optional: window ke andar order
  [ROWS|RANGE BETWEEN          -- optional: frame define karo
    frame_start AND frame_end]
)
```

| Clause | Kya karta hai | Optional? |
|---|---|---|
| `PARTITION BY` | Rows ko groups mein divide karta hai | ✅ Haan |
| `ORDER BY` | Window ke andar rows ka order | ✅ (kuch functions mein required) |
| `ROWS BETWEEN` | Frame — kitni rows consider karni hain | ✅ Haan |

---

## 3. Window Frame — PRECEDING & FOLLOWING

**Train Seat Trick 🚂** — Tum Seat 3 (value `300`) par baithe ho:

```
Seat:   [ 100 ]  [ 200 ]  [ 300 ]  [ 500 ]  [ 700 ]
                           ↑ YOU
         ←←← PRECEDING    ↑    FOLLOWING →→→
```

### Frame Keywords

| Keyword | Meaning | Visual |
|---|---|---|
| `PRECEDING` | Tumse pehle — LEFT side | `[100] [200] [YOU]` |
| `FOLLOWING` | Tumhare baad — RIGHT side | `[YOU] [500] [700]` |
| `CURRENT ROW` | Sirf tumhari row | `[YOU]` |
| `1 PRECEDING` | 1 row pehle + current | `[200] [YOU]` |
| `2 PRECEDING` | 2 rows pehle + current | `[100] [200] [YOU]` |
| `UNBOUNDED PRECEDING` | Pehli row se current tak | `[100] [200] [YOU]` (no limit) |
| `UNBOUNDED FOLLOWING` | Current se last row tak | `[YOU] [500] [700]` (no limit) |

### Common Frame Patterns

```sql
-- Running Total (pehli row se current tak)
ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW

-- Full window (saari rows)
ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING

-- 3-row sliding window (1 pehle + current + 1 baad)
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING

-- Current se last tak
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
```

### ROWS vs RANGE

| | `ROWS` | `RANGE` |
|---|---|---|
| Count | Physical row count (exact N rows) | Value-based (ties included) |
| Duplicate handling | Alag rows | Same value wali saari rows ek saath |
| Use when | Exact sliding window | Cumulative with ties |

> 💡 **Memory Line:**
> `PRECEDING` = Left (past) · `CURRENT ROW` = Abhi · `FOLLOWING` = Right (future) · `UNBOUNDED` = No limit

---

## 4. Ranking Functions

### ROW_NUMBER() — Har row unique number

```sql
SELECT emp_name, salary,
  ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;
```

- Duplicate ho ya na ho — number hamesha increment hoga
- Unique serial number guaranteed

---

### RANK() — Same rank, gap aata hai

```sql
SELECT emp_name, salary,
  RANK() OVER(ORDER BY salary DESC) AS rnk
FROM employees;
```

- Same value = same rank
- Next rank **skip** hoti hai (Olympic medal style 🏅)

---

### DENSE_RANK() — Same rank, no gap

```sql
SELECT emp_name, salary,
  DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rnk
FROM employees;
```

- Same value = same rank
- **Koi rank skip nahi** hoti

---

### Side-by-Side Comparison

| value | ROW\_NUMBER | RANK | DENSE\_RANK |
|---|---|---|---|
| 100 | 1 | 1 | 1 |
| 200 | 2 | 2 | 2 |
| 200 | 3 | 2 | 2 |
| 300 | 4 | 4 ← skip | 3 ← no gap |
| 500 | 5 | 5 | 4 |
| 500 | 6 | 5 | 4 |
| 700 | 7 | 7 ← skip | 5 ← no gap |

> 🧠 **Ek line mein yaad rakho:**
> - `ROW_NUMBER` = Every row unique
> - `RANK` = Same rank + **gaps**
> - `DENSE_RANK` = Same rank, **no gaps**

---

### Interview Classic — Nth Highest Salary

```sql
-- 2nd highest salary (duplicates handle karo)
SELECT emp_name, salary
FROM (
  SELECT emp_name, salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
  FROM employees
) ranked
WHERE rnk = 2;
```

> ⚠️ **DENSE_RANK use karo, RANK nahi** — RANK gap ki wajah se rows miss kar sakta hai.

### PARTITION BY ke saath Ranking

```sql
-- Har department mein alag rank
SELECT emp_name, dept, salary,
  DENSE_RANK() OVER(PARTITION BY dept ORDER BY salary DESC) AS dept_rank
FROM employees;
```

---

## 5. Aggregate as Window Functions

`SUM`, `AVG`, `COUNT`, `MIN`, `MAX` — sab `OVER()` ke saath window functions ki tarah kaam karte hain.

### Running Total (Cumulative SUM)

```sql
SELECT order_date, amount,
  SUM(amount) OVER(
    ORDER BY order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM orders;
```

### Moving Average (3-day)

```sql
SELECT order_date, amount,
  AVG(amount) OVER(
    ORDER BY order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS moving_avg_3day
FROM orders;
```

### Department-wise Stats (har row pe)

```sql
SELECT emp_name, dept, salary,
  SUM(salary)   OVER(PARTITION BY dept) AS dept_total,
  AVG(salary)   OVER(PARTITION BY dept) AS dept_avg,
  MIN(salary)   OVER(PARTITION BY dept) AS dept_min,
  MAX(salary)   OVER(PARTITION BY dept) AS dept_max,
  COUNT(*)      OVER(PARTITION BY dept) AS dept_headcount
FROM employees;
```

### % of Total

```sql
SELECT emp_name, salary,
  ROUND(salary * 100.0 / SUM(salary) OVER(), 2) AS pct_of_total
FROM employees;
```

---

## 6. LAG & LEAD

Pichli ya agali row ki value access karo — **bina self-join ke**.

```sql
LAG (col, offset=1, default=NULL) OVER([PARTITION BY] ORDER BY ...)
LEAD(col, offset=1, default=NULL) OVER([PARTITION BY] ORDER BY ...)
```

| Function | Kya laata hai | Common use |
|---|---|---|
| `LAG(col)` | Pichli row ki value | Month-over-month change |
| `LAG(col, 2)` | 2 rows pehle ki value | Year-over-year comparison |
| `LEAD(col)` | Agali row ki value | Future value compare |
| `LAG(col, 1, 0)` | Pichli value, NULL hone par 0 | NULL avoid karna |

### Month-over-Month Sales Change

```sql
SELECT month, sales,
  LAG(sales)             OVER(ORDER BY month) AS prev_month_sales,
  sales - LAG(sales)     OVER(ORDER BY month) AS mom_change
FROM monthly_sales;
```

### Days Between Consecutive Orders (per customer)

```sql
SELECT customer_id, order_date,
  DATEDIFF(
    order_date,
    LAG(order_date) OVER(PARTITION BY customer_id ORDER BY order_date)
  ) AS days_since_last_order
FROM orders;
```

---

## 7. FIRST\_VALUE & LAST\_VALUE

Window ke **pehle** ya **aakhri** row ki value laao.

```sql
FIRST_VALUE(col) OVER([PARTITION BY] ORDER BY ...)
LAST_VALUE(col)  OVER([PARTITION BY] ORDER BY ...
  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)  -- important!
```

> ⚠️ **LAST\_VALUE Trap:** Default frame sirf `CURRENT ROW` tak hoti hai — isliye LAST_VALUE hamesha current row return karta lagta hai.
> **Fix:** `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` add karo.

```sql
-- Har dept ka highest aur lowest salary — every row pe
SELECT emp_name, dept, salary,
  FIRST_VALUE(salary) OVER(
    PARTITION BY dept ORDER BY salary DESC
  ) AS dept_max_sal,
  LAST_VALUE(salary) OVER(
    PARTITION BY dept ORDER BY salary DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS dept_min_sal
FROM employees;
```

---

## 8. NTILE

Rows ko **n equal buckets** mein divide karo. Sales quartiles, performance bands ke liye.

```sql
SELECT emp_name, salary,
  NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;
-- Quartile 1 = Top 25%,  4 = Bottom 25%
```

| NTILE value | Meaning |
|---|---|
| 1 | Top bucket (highest) |
| 2 | Second quartile |
| 3 | Third quartile |
| 4 | Bottom bucket (lowest) |

> 💡 Agar rows equally divide nahi hoti, toh pehle wale buckets mein ek extra row jaati hai.
> Example: 10 rows, `NTILE(3)` → buckets: **4, 3, 3**

---

## 9. PERCENT\_RANK & CUME\_DIST

### PERCENT\_RANK() — Relative position (0 to 1)

**Formula:** `(rank - 1) / (total rows - 1)`

- Pehli row hamesha `0`
- Last row hamesha `1`

```sql
SELECT emp_name, salary,
  ROUND(PERCENT_RANK() OVER(ORDER BY salary) * 100, 1) AS pct_rank
FROM employees;
```

### CUME\_DIST() — Cumulative distribution (>0 to 1)

**Formula:** `rows <= current value / total rows`

"Kitne percent log is value se **kam ya equal** hain"

```sql
SELECT emp_name, salary,
  ROUND(CUME_DIST() OVER(ORDER BY salary) * 100, 1) AS cume_dist_pct
FROM employees;
```

| Function | Range | First row | Last row | Use case |
|---|---|---|---|---|
| `PERCENT_RANK()` | 0 to 1 | 0 | 1 | Relative position |
| `CUME_DIST()` | >0 to 1 | 1/n | 1 | "Top X%" filtering |

---

## 10. PARTITION BY — Deep Dive

`PARTITION BY` = `GROUP BY` jaisa — lekin rows collapse nahi hoti. Har partition ek alag "mini-window" hai.

```sql
-- Bina PARTITION BY — ek badi window, sab rows
SUM(salary) OVER(ORDER BY salary)

-- PARTITION BY ke saath — har dept alag window
SUM(salary) OVER(PARTITION BY dept ORDER BY salary)

-- Multiple columns pe partition
RANK() OVER(PARTITION BY dept, year ORDER BY salary DESC)
```

### Real Example — Top earner per department

```sql
SELECT * FROM (
  SELECT emp_name, dept, salary,
    DENSE_RANK() OVER(PARTITION BY dept ORDER BY salary DESC) AS rnk
  FROM employees
) t
WHERE rnk = 1;
```

---

## 11. Interview Questions

### Q1: 3rd highest salary (duplicates handle karo)

```sql
SELECT emp_name, salary FROM (
  SELECT emp_name, salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
  FROM employees
) t WHERE rnk = 3;
```

---

### Q2: Har department ka top 2 earner

```sql
SELECT emp_name, dept, salary FROM (
  SELECT emp_name, dept, salary,
    ROW_NUMBER() OVER(PARTITION BY dept ORDER BY salary DESC) AS rn
  FROM employees
) t WHERE rn <= 2;
```

---

### Q3: Consecutive login streak detect karo

```sql
SELECT user_id, login_date,
  DATE_SUB(login_date, INTERVAL
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY login_date)
  DAY) AS streak_group
FROM logins;
-- Same streak_group = consecutive days
```

---

### Q4: Running total per month per category

```sql
SELECT month, category, revenue,
  SUM(revenue) OVER(
    PARTITION BY category
    ORDER BY month
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_revenue
FROM sales;
```

---

### Q5: Previous order amount compare karo — same customer

```sql
SELECT customer_id, order_date, amount,
  LAG(amount, 1, 0) OVER(
    PARTITION BY customer_id ORDER BY order_date
  ) AS prev_amount,
  amount - LAG(amount, 1, 0) OVER(
    PARTITION BY customer_id ORDER BY order_date
  ) AS change
FROM orders;
```

---

## 12. Cheatsheet

| Kaam | Query |
|---|---|
| Serial number | `ROW_NUMBER() OVER(ORDER BY id)` |
| Rank with gap | `RANK() OVER(ORDER BY score DESC)` |
| Rank no gap | `DENSE_RANK() OVER(ORDER BY score DESC)` |
| Running total | `SUM(amt) OVER(ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)` |
| Moving avg (3 rows) | `AVG(amt) OVER(ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)` |
| Prev row value | `LAG(col) OVER(ORDER BY date)` |
| Next row value | `LEAD(col) OVER(ORDER BY date)` |
| First in group | `FIRST_VALUE(col) OVER(PARTITION BY grp ORDER BY col)` |
| Last in group | `LAST_VALUE(col) OVER(PARTITION BY grp ORDER BY col ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)` |
| Quartile bucket | `NTILE(4) OVER(ORDER BY salary DESC)` |
| % rank | `PERCENT_RANK() OVER(ORDER BY salary)` |
| Cumulative % | `CUME_DIST() OVER(ORDER BY salary)` |
| Dept total on each row | `SUM(sal) OVER(PARTITION BY dept)` |
| Nth highest salary | `WHERE DENSE_RANK() OVER(ORDER BY sal DESC) = N` |

---

### All Functions — Quick Reference

| Function | ORDER BY Required | PARTITION BY | Frame Support | Returns |
|---|---|---|---|---|
| `ROW_NUMBER()` | ✅ | Optional | ❌ | Unique 1..n |
| `RANK()` | ✅ | Optional | ❌ | Same rank + gaps |
| `DENSE_RANK()` | ✅ | Optional | ❌ | Same rank, no gaps |
| `NTILE(n)` | ✅ | Optional | ❌ | Bucket 1..n |
| `LAG() / LEAD()` | ✅ | Optional | ❌ | Offset row value |
| `FIRST_VALUE()` | Optional | Optional | ✅ | First row in frame |
| `LAST_VALUE()` | Optional | Optional | ✅ ⚠️ Required | Last row in frame |
| `SUM() / AVG()` | Optional | Optional | ✅ | Aggregate over frame |
| `PERCENT_RANK()` | ✅ | Optional | ❌ | 0 to 1 |
| `CUME_DIST()` | ✅ | Optional | ❌ | >0 to 1 |

