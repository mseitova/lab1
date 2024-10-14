CREATE DATABASE lab5;

CREATE TABLE customers1 (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman1(salesman_id) ON DELETE CASCADE
);

CREATE TABLE orders1 (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers1(customer_id) ON DELETE CASCADE
);

CREATE TABLE salesman1 (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);

INSERT INTO customers1 (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders1 (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);

INSERT INTO salesman1 (salesman_id, name, city, commission)
VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Berlin', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);


SELECT SUM(purch_amt) FROM orders1;

SELECT AVG(purch_amt) FROM orders1;

SELECT COUNT(*) FROM customers1;

SELECT MIN(purch_amt) FROM orders1;

SELECT * FROM customers1 WHERE cust_name LIKE '%o';

SELECT * FROM orders1
JOIN customers1 ON orders1.customer_id = customers1.customer_id
WHERE customers1.city = 'New York';

SELECT * FROM customers1
JOIN orders1 ON customers1.customer_id = orders1.customer_id
WHERE orders1.purch_amt > 10;

SELECT SUM(grade) FROM customers1;

SELECT cust_name FROM customers1 WHERE cust_name IS NOT NULL;

SELECT MAX(grade) FROM customers1;



