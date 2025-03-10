/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.name, c.name
FROM products as p
JOIN categories as c ON p.categoryid = c.categoryid
WHERE c.name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT product_name, price, rating
FROM products
WHERE rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.employee_name, SUM(s.quantity_sold) AS total_quantity_sold
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
GROUP BY e.employee_name
ORDER BY total_quantity_sold DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.department_name, c.category_name
FROM departments d
JOIN categories c ON d.department_id = c.department_id
WHERE c.category_name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.product_name, SUM(s.quantity_sold) AS total_quantity_sold, SUM(s.total_price) AS total_price_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE p.product_name = 'Hotel California' AND p.brand = 'Eagles'
GROUP BY p.product_name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.product_name, r.reviewer_name, r.rating, r.comment
FROM reviews r
JOIN products p ON r.product_id = p.product_id
WHERE p.product_name = 'Visio TV'
ORDER BY r.rating ASC
LIMIT 1;
