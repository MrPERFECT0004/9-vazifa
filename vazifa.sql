CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Toys'),
(5, 'Groceries');

INSERT INTO products (product_id, product_name, category_id) VALUES
(1, 'Laptop', 1),
(2, 'Smartphone', 1),
(3, 'TV', 1),
(4, 'Headphones', 1),
(5, 'Camera', 1),
(6, 'T-shirt', 2),
(7, 'Jeans', 2),
(8, 'Jacket', 2),
(9, 'Dress', 2),
(10, 'Socks', 2),
(11, 'Book 1', 3),
(12, 'Book 2', 3),
(13, 'Toy Car', 4),
(14, 'Doll', 4),
(15, 'Apple', 5);

SELECT p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id;

SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;


SELECT p.product_name, c.category_name
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id;


SELECT product_name
FROM products
WHERE category_id IS NULL;

SELECT category_name
FROM categories
WHERE category_id NOT IN (SELECT category_id FROM products);

SELECT p.product_name, c.category_name
FROM products p
FULL OUTER JOIN categories c ON p.category_id = c.category_id;

SELECT p.product_name, c.category_name
FROM products p
FULL OUTER JOIN categories c ON p.category_id = c.category_id
WHERE p.product_name IS NULL OR c.category_name IS NULL;

SELECT p.product_name, c.category_name
FROM products p
CROSS JOIN categories c;


SELECT p.product_name, c.category_name
FROM products p
NATURAL JOIN categories c;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);


INSERT INTO employees (employee_id, employee_name, manager_id) VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'David', 2),
(5, 'Eve', 2);


SELECT a.employee_name AS Employee, b.employee_name AS Manager
FROM employees a
LEFT JOIN employees b ON a.manager_id = b.employee-id;
