 DROP DATABASE IF EXISTS MyDatabase;
Query OK, 0 rows affected, 1 warning (0.06 sec)

mysql> CREATE DATABASE MyDatabase;
Query OK, 1 row affected (0.03 sec)

mysql> USE MyDatabase;
Database changed
mysql>
mysql> -- ======================================================
mysql> -- Table: customers
mysql> -- ======================================================
mysql> DROP TABLE IF EXISTS customers;
Query OK, 0 rows affected, 1 warning (0.02 sec)

mysql>
mysql> CREATE TABLE customers (
    ->     id INT NOT NULL,
    ->     first_name VARCHAR(50),
    ->     country VARCHAR(50),
    ->     score INT,
    ->     PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (0.06 sec)

mysql>
mysql> -- Insert customers data
mysql> INSERT INTO customers (id, first_name, country, score) VALUES
    ->     (1, 'Maria', 'Germany', 350),
    ->     (2, ' John', 'USA', 900),
    ->     (3, 'Georg', 'UK', 750),
    ->     (4, 'Martin', 'Germany', 500),
    ->     (5, 'Peter', 'USA', 0);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- ======================================================
mysql> -- Table: orders
mysql> -- ======================================================
mysql> DROP TABLE IF EXISTS orders;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql>
mysql> CREATE TABLE orders (
    ->     order_id INT NOT NULL,
    ->     customer_id INT NOT NULL,
    ->     order_date DATE,
    ->     sales INT,
    ->     PRIMARY KEY (order_id)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> -- Insert orders data
mysql> INSERT INTO orders (order_id, customer_id, order_date, sales) VALUES
    ->     (1001, 1, '2021-01-11', 35),
    ->     (1002, 2, '2021-04-05', 15),
    ->     (1003, 3, '2021-06-18', 20),
    ->     (1004, 6, '2021-08-31', 10);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> DROP DATABASE IF EXISTS `salesdb`;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> CREATE DATABASE `salesdb` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
Query OK, 1 row affected (0.01 sec)

mysql> USE `salesdb`;
Database changed
mysql>
mysql> -- ======================================================
mysql> -- Table: customers
mysql> -- ======================================================
mysql>
mysql> CREATE TABLE `customers` (
    ->   `customerid` INT NOT NULL PRIMARY KEY,
    ->   `firstname` VARCHAR(50),
    ->   `lastname` VARCHAR(50),
    ->   `country` VARCHAR(50),
    ->   `score` INT
    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> INSERT INTO `customers` (`customerid`,`firstname`,`lastname`,`country`,`score`) VALUES
    ->   (1, 'Jossef', 'Goldberg', 'Germany', 350),
    ->   (2, 'Kevin', 'Brown', 'USA', 900),
    ->   (3, 'Mary', NULL, 'USA', 750),
    ->   (4, 'Mark', 'Schwarz', 'Germany', 500),
    ->   (5, 'Anna', 'Adams', 'USA', NULL);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- ======================================================
mysql> -- Table: employees
mysql> -- ======================================================
mysql>
mysql> CREATE TABLE `employees` (
    ->   `employeeid` INT NOT NULL PRIMARY KEY,
    ->   `firstname` VARCHAR(50),
    ->   `lastname` VARCHAR(50),
    ->   `department` VARCHAR(50),
    ->   `birthdate` DATE,
    ->   `gender` CHAR(1),
    ->   `salary` INT,
    ->   `managerid` INT,
    ->   INDEX (`managerid`),
    ->   CONSTRAINT `fk_employees_manager`
    ->     FOREIGN KEY (`managerid`)
    ->     REFERENCES `employees` (`employeeid`)
    ->     ON DELETE SET NULL
    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
Query OK, 0 rows affected (0.04 sec)

mysql>
mysql> INSERT INTO `employees` (`employeeid`,`firstname`,`lastname`,`department`,`birthdate`,`gender`,`salary`,`managerid`) VALUES
    ->   (1, 'Frank', 'Lee', 'Marketing', '1988-12-05', 'M', 55000, NULL),
    ->   (2, 'Kevin', 'Brown', 'Marketing', '1972-11-25', 'M', 65000, 1),
    ->   (3, 'Mary', NULL, 'Sales', '1986-01-05', 'F', 75000, 1),
    ->   (4, 'Michael', 'Ray', 'Sales', '1977-02-10', 'M', 90000, 2),
    ->   (5, 'Carol', 'Baker', 'Sales', '1982-02-11', 'F', 55000, 3);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- ======================================================
mysql> -- Table: products
mysql> -- ======================================================
mysql>
mysql> CREATE TABLE `products` (
    ->   `productid` INT NOT NULL PRIMARY KEY,
    ->   `product` VARCHAR(50),
    ->   `category` VARCHAR(50),
    ->   `price` INT
    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> INSERT INTO `products` (`productid`,`product`,`category`,`price`) VALUES
    ->   (101, 'Bottle', 'Accessories', 10),
    ->   (102, 'Tire', 'Accessories', 15),
    ->   (103, 'Socks', 'Clothing', 20),
    ->   (104, 'Caps', 'Clothing', 25),
    ->   (105, 'Gloves', 'Clothing', 30);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>
mysql> -- ======================================================
mysql> -- Table: orders
mysql> -- ======================================================
mysql>
mysql> CREATE TABLE `orders` (
    ->   `orderid` INT NOT NULL PRIMARY KEY,
    ->   `productid` INT,
    ->   `customerid` INT,
    ->   `salespersonid` INT,
    ->   `orderdate` DATE,
    ->   `shipdate` DATE,
    ->   `orderstatus` VARCHAR(50),
    ->   `shipaddress` VARCHAR(255),
    ->   `billaddress` VARCHAR(255),
    ->   `quantity` INT,
    ->   `sales` INT,
    ->   `creationtime` TIMESTAMP,
    ->   INDEX (`productid`),
    ->   INDEX (`customerid`),
    ->   INDEX (`salespersonid`),
    ->   CONSTRAINT `fk_orders_product`
    ->     FOREIGN KEY (`productid`)
    ->     REFERENCES `products` (`productid`)
    ->     ON DELETE SET NULL,
    ->   CONSTRAINT `fk_orders_customer`
    ->     FOREIGN KEY (`customerid`)
    ->     REFERENCES `customers` (`customerid`)
    ->     ON DELETE SET NULL,
    ->   CONSTRAINT `fk_orders_employee`
    ->     FOREIGN KEY (`salespersonid`)
    ->     REFERENCES `employees` (`employeeid`)
    ->     ON DELETE SET NULL
    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO `orders` (
    ->   `orderid`,`productid`,`customerid`,`salespersonid`,
    ->   `orderdate`,`shipdate`,`orderstatus`,`shipaddress`,
    ->   `billaddress`,`quantity`,`sales`,`creationtime`
    -> ) VALUES
    ->   (1, 101, 2, 3, '2025-01-01', '2025-01-05', 'Delivered', '9833 Mt. Dias Blv.', '1226 Shoe St.', 1, 10, '2025-01-01 12:34:56'),
    ->   (2, 102, 3, 3, '2025-01-05', '2025-01-10', 'Shipped', '250 Race Court', NULL, 1, 15, '2025-01-05 23:22:04'),
    ->   (3, 101, 1, 5, '2025-01-10', '2025-01-25', 'Delivered', '8157 W. Book', '8157 W. Book', 2, 20, '2025-01-10 18:24:08'),
    ->   (4, 105, 1, 3, '2025-01-20', '2025-01-25', 'Shipped', '5724 Victory Lane', '', 2, 60, '2025-01-20 05:50:33'),
    ->   (5, 104, 2, 5, '2025-02-01', '2025-02-05', 'Delivered', NULL, NULL, 1, 25, '2025-02-01 14:02:41'),
    ->   (6, 104, 3, 5, '2025-02-05', '2025-02-10', 'Delivered', '1792 Belmont Rd.', NULL, 2, 50, '2025-02-06 15:34:57'),
    ->   (7, 102, 1, 1, '2025-02-15', '2025-02-27', 'Delivered', '136 Balboa Court', '', 2, 30, '2025-02-16 06:22:01'),
    ->   (8, 101, 4, 3, '2025-02-18', '2025-02-27', 'Shipped', '2947 Vine Lane', '4311 Clay Rd', 3, 90, '2025-02-18 10:45:22'),
    ->   (9, 101, 2, 3, '2025-03-10', '2025-03-15', 'Shipped', '3768 Door Way', '', 2, 20, '2025-03-10 12:59:04'),
    ->   (10, 102, 3, 5, '2025-03-15', '2025-03-20', 'Shipped', NULL, NULL, 0, 60, '2025-03-16 23:25:15');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql>
mysql> -- ======================================================
mysql> -- Table: orders_archive
mysql> -- ======================================================
mysql>
mysql> CREATE TABLE `orders_archive` (
    ->   `orderid` INT,
    ->   `productid` INT,
    ->   `customerid` INT,
    ->   `salespersonid` INT,
    ->   `orderdate` DATE,
    ->   `shipdate` DATE,
    ->   `orderstatus` VARCHAR(50),
    ->   `shipaddress` VARCHAR(255),
    ->   `billaddress` VARCHAR(255),
    ->   `quantity` INT,
    ->   `sales` INT,
    ->   `creationtime` TIMESTAMP,
    ->   INDEX (`productid`),
    ->   INDEX (`customerid`),
    ->   INDEX (`salespersonid`)
    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> INSERT INTO `orders_archive` (
    ->   `orderid`,`productid`,`customerid`,`salespersonid`,
    ->   `orderdate`,`shipdate`,`orderstatus`,`shipaddress`,
    ->   `billaddress`,`quantity`,`sales`,`creationtime`
    -> ) VALUES
    ->   (1, 101, 2, 3, '2024-04-01', '2024-04-05', 'Shipped', '123 Main St', '456 Billing St', 1, 10, '2024-04-01 12:34:56'),
    ->   (2, 102, 3, 3, '2024-04-05', '2024-04-10', 'Shipped', '456 Elm St', '789 Billing St', 1, 15, '2024-04-05 23:22:04'),
    ->   (3, 101, 1, 4, '2024-04-10', '2024-04-25', 'Shipped', '789 Maple St', '789 Maple St', 2, 20, '2024-04-10 18:24:08'),
    ->   (4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Shipped', '987 Victory Lane', '', 2, 60, '2024-04-20 05:50:33'),
    ->   (4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Delivered', '987 Victory Lane', '', 2, 60, '2024-04-20 14:50:33'),
    ->   (5, 104, 2, 5, '2024-05-01', '2024-05-05', 'Shipped', '345 Oak St', '678 Pine St', 1, 25, '2024-05-01 14:02:41'),
    ->   (6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', NULL, 2, 50, '2024-05-06 15:34:57'),
    ->   (6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-07 13:22:05'),
    ->   (6, 101, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-12 20:36:55'),
    ->   (7, 102, 3, 5, '2024-06-15', '2024-06-20', 'Shipped', '111 Main St', '222 Billing St', 0, 60, '2024-06-16 23:25:15');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql>
mysql> USE MyDatabase
Database changed
mysql> show table
    ->
    -> SHOW TABLES:
    -> SHOW TABLES;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SHOW TABLES:
SHOW TABLES' at line 3
mysql> Show Tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| customers            |
| orders               |
+----------------------+
2 rows in set (0.04 sec)

mysql> SELECT * FROM customers
    -> SELECT * FROM customers;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT * FROM customers' at line 2
mysql> SELECT * FROM customers;
+----+------------+---------+-------+
| id | first_name | country | score |
+----+------------+---------+-------+
|  1 | Maria      | Germany |   350 |
|  2 |  John      | USA     |   900 |
|  3 | Georg      | UK      |   750 |
|  4 | Martin     | Germany |   500 |
|  5 | Peter      | USA     |     0 |
+----+------------+---------+-------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM orders;
+----------+-------------+------------+-------+
| order_id | customer_id | order_date | sales |
+----------+-------------+------------+-------+
|     1001 |           1 | 2021-01-11 |    35 |
|     1002 |           2 | 2021-04-05 |    15 |
|     1003 |           3 | 2021-06-18 |    20 |
|     1004 |           6 | 2021-08-31 |    10 |
+----------+-------------+------------+-------+
4 rows in set (0.00 sec)

mysql> SELECT first_name , score FROM customers;
+------------+-------+
| first_name | score |
+------------+-------+
| Maria      |   350 |
|  John      |   900 |
| Georg      |   750 |
| Martin     |   500 |
| Peter      |     0 |
+------------+-------+
5 rows in set (0.00 sec)

mysql>  SLECT * FROM customers WHERE country = USA;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SLECT * FROM customers WHERE country = USA' at line 1
mysql>  SLECT * FROM customers WHERE country = USA;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SLECT * FROM customers WHERE country = USA' at line 1
mysql>  SLECT * FROM customers WHERE country = USA ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SLECT * FROM customers WHERE country = USA' at line 1
mysql>  SLECT * FROM customers WHERE country = 'USA' ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SLECT * FROM customers WHERE country = 'USA'' at line 1
mysql>  SLECT * FROM customers WHERE country = 'USA';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SLECT * FROM customers WHERE country = 'USA'' at line 1
mysql>  SELECT * FROM customers WHERE country = 'USA';
+----+------------+---------+-------+
| id | first_name | country | score |
+----+------------+---------+-------+
|  2 |  John      | USA     |   900 |
|  5 | Peter      | USA     |     0 |
+----+------------+---------+-------+
2 rows in set (0.00 sec)

mysql>  SELECT * FROM customers WHERE score ! = 0 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '! = 0' at line 1
mysql>  SELECT * FROM customers WHERE score != 0 ;
+----+------------+---------+-------+
| id | first_name | country | score |
+----+------------+---------+-------+
|  1 | Maria      | Germany |   350 |
|  2 |  John      | USA     |   900 |
|  3 | Georg      | UK      |   750 |
|  4 | Martin     | Germany |   500 |
+----+------------+---------+-------+
4 rows in set (0.00 sec)

mysql>  SELECT * FROM customers WHERE score ! = 0  AND country = 'USA';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '! = 0  AND country = 'USA'' at line 1
mysql>  SELECT * FROM customers WHERE score != 0  AND country = 'USA';
+----+------------+---------+-------+
| id | first_name | country | score |
+----+------------+---------+-------+
|  2 |  John      | USA     |   900 |
+----+------------+---------+-------+
1 row in set (0.00 sec)

mysql> SELECT * FROM customers ORDER BY score;
+----+------------+---------+-------+
| id | first_name | country | score |
+----+------------+---------+-------+
|  5 | Peter      | USA     |     0 |
|  1 | Maria      | Germany |   350 |
|  4 | Martin     | Germany |   500 |
|  3 | Georg      | UK      |   750 |
|  2 |  John      | USA     |   900 |
+----+------------+---------+-------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM customers ORDER BY country DESC;
+----+------------+---------+-------+
| id | first_name | country | score |
+----+------------+---------+-------+
|  2 |  John      | USA     |   900 |
|  5 | Peter      | USA     |     0 |
|  3 | Georg      | UK      |   750 |
|  1 | Maria      | Germany |   350 |
|  4 | Martin     | Germany |   500 |
+----+------------+---------+-------+
5 rows in set (0.03 sec)

mysql> SELECT country sum(score) FROM customers GROUP BY country;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sum(score) FROM customers GROUP BY country' at line 1
mysql> SELECT country , sum(score) FROM customers GROUP BY country;
+---------+------------+
| country | sum(score) |
+---------+------------+
| Germany |        850 |
| USA     |        900 |
| UK      |        750 |
+---------+------------+
3 rows in set (0.01 sec)

mysql> SELECT country , sum(score) AS total_score  FROM customers GROUP BY country;
+---------+-------------+
| country | total_score |
+---------+-------------+
| Germany |         850 |
| USA     |         900 |
| UK      |         750 |
+---------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT country , COUNT(first_name) , sum(score) FROM customers GROUP BY country;
+---------+-------------------+------------+
| country | COUNT(first_name) | sum(score) |
+---------+-------------------+------------+
| Germany |                 2 |        850 |
| USA     |                 2 |        900 |
| UK      |                 1 |        750 |
+---------+-------------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT country sum(score) as total_score From customers GROUP BY country HAVING sum(score)>800;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sum(score) as total_score From customers GROUP BY country HAVING sum(score)>800' at line 1
mysql> SELECT country sum(score)  FROM customers GROUP BY country HAVING sum(score)>800;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sum(score)  FROM customers GROUP BY country HAVING sum(score)>800' at line 1
mysql> SELECT country, sum(score)  FROM customers GROUP BY country HAVING sum(score)>800;
+---------+------------+
| country | sum(score) |
+---------+------------+
| Germany |        850 |
| USA     |        900 |
+---------+------------+
2 rows in set (0.01 sec)

mysql> SELECT country , AVG(score) FROM customer WHERE score != 0 GROUP BY country having AVG(score) > 430;
ERROR 1146 (42S02): Table 'mydatabase.customer' doesn't exist
mysql> SELECT country , AVG(score) FROM customers WHERE score != 0 GROUP BY country having AVG(score) > 430;
+---------+------------+
| country | AVG(score) |
+---------+------------+
| USA     |   900.0000 |
| UK      |   750.0000 |
+---------+------------+
2 rows in set (0.00 sec)

mysql> SELECT TOP 3* FROM customers ORDER BY score DESC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '3* FROM customers ORDER BY score DESC' at line 1
mysql> SELECT TOP 3 * FROM customers ORDER BY score DESC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '3 * FROM customers ORDER BY score DESC' at line 1
mysql> SELECT *
    -> FROM customers
    -> ORDER BY score DESC
    -> LIMIT 3;
+----+------------+---------+-------+
| id | first_name | country | score |
+----+------------+---------+-------+
|  2 |  John      | USA     |   900 |
|  3 | Georg      | UK      |   750 |
|  4 | Martin     | Germany |   500 |
+----+------------+---------+-------+
3 rows in set (0.00 sec)

mysql> -- Create database
mysql> CREATE DATABASE sql_practice;
Query OK, 1 row affected (0.04 sec)

mysql>
mysql> -- Select database
mysql> USE sql_practice;
Database changed
mysql>
mysql> -- Create table
mysql> CREATE TABLE employees (
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     department VARCHAR(50),
    ->     city VARCHAR(50),
    ->     salary INT
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> -- Insert data
mysql> INSERT INTO employees (id, name, department, city, salary)
    -> VALUES
    -> (1, 'Aisha', 'IT', 'Jaipur', 60000),
    -> (2, 'Rahul', 'HR', 'Delhi', 45000),
    -> (3, 'Neha', 'IT', 'Jaipur', 75000),
    -> (4, 'Arjun', 'Sales', 'Mumbai', 50000),
    -> (5, 'Priya', 'HR', 'Delhi', 55000),
    -> (6, 'Karan', 'IT', 'Delhi', 65000),
    -> (7, 'Riya', 'Sales', 'Mumbai', 70000),
    -> (8, 'Aman', 'IT', 'Jaipur', 80000),
    -> (9, 'Simran', 'HR', 'Jaipur', 60000),
    -> (10, 'Varun', 'Sales', 'Delhi', 55000);
Query OK, 10 rows affected (0.04 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employees;
+----+--------+------------+--------+--------+
| id | name   | department | city   | salary |
+----+--------+------------+--------+--------+
|  1 | Aisha  | IT         | Jaipur |  60000 |
|  2 | Rahul  | HR         | Delhi  |  45000 |
|  3 | Neha   | IT         | Jaipur |  75000 |
|  4 | Arjun  | Sales      | Mumbai |  50000 |
|  5 | Priya  | HR         | Delhi  |  55000 |
|  6 | Karan  | IT         | Delhi  |  65000 |
|  7 | Riya   | Sales      | Mumbai |  70000 |
|  8 | Aman   | IT         | Jaipur |  80000 |
|  9 | Simran | HR         | Jaipur |  60000 |
| 10 | Varun  | Sales      | Delhi  |  55000 |
+----+--------+------------+--------+--------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM employees WHERE salary> 60000;
+----+-------+------------+--------+--------+
| id | name  | department | city   | salary |
+----+-------+------------+--------+--------+
|  3 | Neha  | IT         | Jaipur |  75000 |
|  6 | Karan | IT         | Delhi  |  65000 |
|  7 | Riya  | Sales      | Mumbai |  70000 |
|  8 | Aman  | IT         | Jaipur |  80000 |
+----+-------+------------+--------+--------+
4 rows in set (0.00 sec)

mysql> SELECT name , city FROM employees WHERE department = IT;
ERROR 1054 (42S22): Unknown column 'IT' in 'where clause'
mysql> SELECT name , city FROM employees WHERE department = 'IT';
+-------+--------+
| name  | city   |
+-------+--------+
| Aisha | Jaipur |
| Neha  | Jaipur |
| Karan | Delhi  |
| Aman  | Jaipur |
+-------+--------+
4 rows in set (0.00 sec)

mysql> SELECT name FROM employees WHERE salary <= 55000;
+-------+
| name  |
+-------+
| Rahul |
| Arjun |
| Priya |
| Varun |
+-------+
4 rows in set (0.00 sec)

mysql> SELECT name FROM employees WHERE city = 'Jaipur;
    '> SELECT name FROM employees WHERE city = 'Jaipur';
    '>
    '> SELECT name FROM employees WHERE city = 'Jaipur;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Jaipur';

SELECT name FROM employees WHERE city = 'Jaipur' at line 2
mysql> SELECT * FROM employees WHERE city = 'Jaipur';
+----+--------+------------+--------+--------+
| id | name   | department | city   | salary |
+----+--------+------------+--------+--------+
|  1 | Aisha  | IT         | Jaipur |  60000 |
|  3 | Neha   | IT         | Jaipur |  75000 |
|  8 | Aman   | IT         | Jaipur |  80000 |
|  9 | Simran | HR         | Jaipur |  60000 |
+----+--------+------------+--------+--------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM employees WHERE city != 'Delhi';
+----+--------+------------+--------+--------+
| id | name   | department | city   | salary |
+----+--------+------------+--------+--------+
|  1 | Aisha  | IT         | Jaipur |  60000 |
|  3 | Neha   | IT         | Jaipur |  75000 |
|  4 | Arjun  | Sales      | Mumbai |  50000 |
|  7 | Riya   | Sales      | Mumbai |  70000 |
|  8 | Aman   | IT         | Jaipur |  80000 |
|  9 | Simran | HR         | Jaipur |  60000 |
+----+--------+------------+--------+--------+
6 rows in set (0.00 sec)

mysql> SELECT DISTINCT department FROM employees:
    -> SELECT DISTINCT department FROM employees;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ':
SELECT DISTINCT department FROM employees' at line 1
mysql> SELECT DISTINCT department
    -> FROM employees;
+------------+
| department |
+------------+
| IT         |
| HR         |
| Sales      |
+------------+
3 rows in set (0.00 sec)

mysql> SELECT DISTINCT department , city FROM employees;
+------------+--------+
| department | city   |
+------------+--------+
| IT         | Jaipur |
| HR         | Delhi  |
| Sales      | Mumbai |
| IT         | Delhi  |
| HR         | Jaipur |
| Sales      | Delhi  |
+------------+--------+
6 rows in set (0.00 sec)

mysql> SELECT department , COUNT(name) FROM employees GROUP BY department ;
+------------+-------------+
| department | COUNT(name) |
+------------+-------------+
| IT         |           4 |
| HR         |           3 |
| Sales      |           3 |
+------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT department , AVG(salary) FROM employees GROUP BY department ;
+------------+-------------+
| department | AVG(salary) |
+------------+-------------+
| IT         |  70000.0000 |
| HR         |  53333.3333 |
| Sales      |  58333.3333 |
+------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT department , SUM(salary) FROM employees GROUP BY department ;
+------------+-------------+
| department | SUM(salary) |
+------------+-------------+
| IT         |      280000 |
| HR         |      160000 |
| Sales      |      175000 |
+------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT department , COUNT(name) FROM employees GROUP BY department HAVING COUNT(name)>2 ;
+------------+-------------+
| department | COUNT(name) |
+------------+-------------+
| IT         |           4 |
| HR         |           3 |
| Sales      |           3 |
+------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM employees ORDER BY salary DESC;
+----+--------+------------+--------+--------+
| id | name   | department | city   | salary |
+----+--------+------------+--------+--------+
|  8 | Aman   | IT         | Jaipur |  80000 |
|  3 | Neha   | IT         | Jaipur |  75000 |
|  7 | Riya   | Sales      | Mumbai |  70000 |
|  6 | Karan  | IT         | Delhi  |  65000 |
|  1 | Aisha  | IT         | Jaipur |  60000 |
|  9 | Simran | HR         | Jaipur |  60000 |
|  5 | Priya  | HR         | Delhi  |  55000 |
| 10 | Varun  | Sales      | Delhi  |  55000 |
|  4 | Arjun  | Sales      | Mumbai |  50000 |
|  2 | Rahul  | HR         | Delhi  |  45000 |
+----+--------+------------+--------+--------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM employees ORDER BY department DESC;
+----+--------+------------+--------+--------+
| id | name   | department | city   | salary |
+----+--------+------------+--------+--------+
|  4 | Arjun  | Sales      | Mumbai |  50000 |
|  7 | Riya   | Sales      | Mumbai |  70000 |
| 10 | Varun  | Sales      | Delhi  |  55000 |
|  1 | Aisha  | IT         | Jaipur |  60000 |
|  3 | Neha   | IT         | Jaipur |  75000 |
|  6 | Karan  | IT         | Delhi  |  65000 |
|  8 | Aman   | IT         | Jaipur |  80000 |
|  2 | Rahul  | HR         | Delhi  |  45000 |
|  5 | Priya  | HR         | Delhi  |  55000 |
|  9 | Simran | HR         | Jaipur |  60000 |
+----+--------+------------+--------+--------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM employees ORDER BY department DESC , salary ASC;
+----+--------+------------+--------+--------+
| id | name   | department | city   | salary |
+----+--------+------------+--------+--------+
|  4 | Arjun  | Sales      | Mumbai |  50000 |
| 10 | Varun  | Sales      | Delhi  |  55000 |
|  7 | Riya   | Sales      | Mumbai |  70000 |
|  1 | Aisha  | IT         | Jaipur |  60000 |
|  6 | Karan  | IT         | Delhi  |  65000 |
|  3 | Neha   | IT         | Jaipur |  75000 |
|  8 | Aman   | IT         | Jaipur |  80000 |
|  2 | Rahul  | HR         | Delhi  |  45000 |
|  5 | Priya  | HR         | Delhi  |  55000 |
|  9 | Simran | HR         | Jaipur |  60000 |
+----+--------+------------+--------+--------+
10 rows in set (0.00 sec)

mysql> SELECT city , AVG(salary) FROM employees GROUP BY city ORDER BY city DESC , AVG(salary) ASC ;
+--------+-------------+
| city   | AVG(salary) |
+--------+-------------+
| Mumbai |  60000.0000 |
| Jaipur |  68750.0000 |
| Delhi  |  55000.0000 |
+--------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT city, AVG(salary) AS avg_salary
    -> FROM employees
    -> GROUP BY city
    -> ORDER BY avg_salary DESC;
+--------+------------+
| city   | avg_salary |
+--------+------------+
| Jaipur | 68750.0000 |
| Mumbai | 60000.0000 |
| Delhi  | 55000.0000 |
+--------+------------+
3 rows in set (0.00 sec)

mysql> SELECT department , COUNT(name) AS total_num FROM employees GROUP BY department HAVING total_num>= 2;
+------------+-----------+
| department | total_num |
+------------+-----------+
| IT         |         4 |
| HR         |         3 |
| Sales      |         3 |
+------------+-----------+
3 rows in set (0.00 sec)

mysql> SELECT department , AVG(salary) AS avg_sal FROM employees GROUP BY department HAVING avg_sal >50000;
+------------+------------+
| department | avg_sal    |
+------------+------------+
| IT         | 70000.0000 |
| HR         | 53333.3333 |
| Sales      | 58333.3333 |
+------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT department , AVG(salary) AS avg_sal FROM employees GROUP BY department HAVING avg_sal >15000 ORDER BY avg_sal DESC;
+------------+------------+
| department | avg_sal    |
+------------+------------+
| IT         | 70000.0000 |
| Sales      | 58333.3333 |
| HR         | 53333.3333 |
+------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT department , city , COUNT(name) FROM employees GROUP BY department , city;
+------------+--------+-------------+
| department | city   | COUNT(name) |
+------------+--------+-------------+
| IT         | Jaipur |           3 |
| HR         | Delhi  |           2 |
| Sales      | Mumbai |           2 |
| IT         | Delhi  |           1 |
| HR         | Jaipur |           1 |
| Sales      | Delhi  |           1 |
+------------+--------+-------------+
6 rows in set (0.00 sec)

mysql> SELECT department , AVG(salary) as avg_sal FROM employees GROUP BY department ORDER BY avg_sal DESC;
+------------+------------+
| department | avg_sal    |
+------------+------------+
| IT         | 70000.0000 |
| Sales      | 58333.3333 |
| HR         | 53333.3333 |
+------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT department , COUNT(name) AS count_name , AVG (salary ) AS avg_sal FROM employees GROUP BY department HAVING count_name >=3 AND avg_sal >60000;
+------------+------------+------------+
| department | count_name | avg_sal    |
+------------+------------+------------+
| IT         |          4 | 70000.0000 |
+------------+------------+------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE persons()
    -> CREATE TABLE persons()
    -> SELECT department , COUNT(name) AS count_name , AVG (salary ) AS avg_sal FROM employees GROUP BY department HAVING count_name >=3 AND avg_sal >60000;CRE
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')
CREATE TABLE persons()
SELECT department , COUNT(name) AS count_name , AVG (sa' at line 1
    ->
    -> CREATE TABLE persons()
    -> CREATE TABLE persons(
    -> id INT NOT NULL,
    -> name VARCHAR(255) NOT NULL,
    -> birth_date DATE ,
    -> phone_no VARCHAR(255) , )
    -> CREATE TABLE persons( id INT NOT NULL , name VARCHAR(255) NOT NULL , birthdate DATE , phone_no VARCHAR(255) NOT NULL);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CRE

CREATE TABLE persons()
CREATE TABLE persons(
id INT NOT NULL,
name VARCHAR' at line 1
mysql> CREATE TABLE persons( id INT NOT NULL , name VARCHAR(50) NOT NULL , birthdate DATE , phone_no VARCHAR(255) NOT NULL);
Query OK, 0 rows affected (0.08 sec)

mysql> SHOW TABLE persons;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'persons' at line 1
mysql> SHOW TABLE person
    -> SHOW TABLES;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'person
SHOW TABLES' at line 1
mysql> DESC persons;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| id        | int          | NO   |     | NULL    |       |
| name      | varchar(50)  | NO   |     | NULL    |       |
| birthdate | date         | YES  |     | NULL    |       |
| phone_no  | varchar(255) | NO   |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.05 sec)

mysql>
mysql> SHOW TABLES;
+------------------------+
| Tables_in_sql_practice |
+------------------------+
| employees              |
| persons                |
+------------------------+
2 rows in set (0.00 sec)

mysql> USE databases;
ERROR 1049 (42000): Unknown database 'databases'
mysql> USE Mydatabase;
Database changed
mysql> USE sql_practice;
Database changed
mysql> SELECT * FROM persons;
Empty set (0.03 sec)

mysql>