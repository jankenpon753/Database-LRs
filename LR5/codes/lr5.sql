CREATE DATABASE IF NOT EXISTS Relations;

-- creating database and tables.
CREATE TABLE Relations.salesman(
    salesman_id int Auto_Increment Primary key,
    name VARCHAR(30),
    city VARCHAR(20),
    commission DECIMAL(4, 2)
);

--
CREATE TABLE Customer(
    customer_id int Auto_Increment Primary Key,
    customer_name varchar(40),
    city varchar(40),
    grade int,
    salesman_id int,
    Constraint cust_sales Foreign key (salesman_id) References salesman(salesman_id)
) -- 
CREATE TABLE Relations.Order(
    order_no int Auto_Increment Primary Key,
    purchase_amount DECIMAL(6, 2),
    order_date Date,
    customer_id int,
    salesman_id int,
    Constraint cust_order Foreign key (customer_id) References Customer(customer_id),
    Constraint sales_order Foreign key (salesman_id) References salesman(salesman_id)
);

-- --
SELECT
    customer_name as "Customer with highest Commission"
FROM
    Relations.Customer
WHERE
    Customer.customer_id = (
        SELECT
            Order.customer_id
        FROM
            Relations.Order
        ORDER BY
            Order.purchase_amount * (
                SELECT
                    salesman.commission
                FROM
                    Relations.salesman
                WHERE
                    salesman_id = Order.salesman_id
            ) DESC
        LIMIT
            1
    );

-- SELECT
--     max(grade) AS "Maximum Grade",
--     city
-- FROM
--     Relations.Customer
-- GROUP BY
--     city;
-- SELECT
--     SUM(
--         purchase_amount * (
--             SELECT
--                 commission
--             FROM
--                 Relations.salesman
--             WHERE
--                 salesman_id = Order.salesman_id
--         )
--     ) AS "Total Commission",
--     salesman_id as "Salesman ID"
-- FROM
--     Relations.Order
-- WHERE
--     Order.salesman_id = 5001;
--
-- SELECT
--     name as "Salesman Name"
-- FROM
--     Relations.salesman
-- WHERE
--     salesman_id IN (
--         SELECT
--             salesman_id
--         FROM
--             Relations.Customer
--         WHERE
--             grade IN (
--                 SELECT
--                     MIN(grade)
--                 FROM
--                     Relations.Customer
--             )
--     ) -- SELECT
--     COUNT(order_no) as "Total order from 2016/9/5 to 2016/10/17"
-- FROM
--     Relations.Order
-- WHERE
--     order_date BETWEEN '2016-09-05'
--     AND '2016-10-17';