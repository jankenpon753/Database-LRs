SELECT
    c.customer_name as "Customer Name",
    s.commission as Commission
FROM
    Relations.Customer c
    JOIN Relations.salesman s ON c.salesman_id = s.salesman_id
ORDER BY
    s.commission DESC
LIMIT
    1;

SELECT
    s.name as "Salesman Name",
    SUM(o.purchase_amount * s.commission) as "Total Commission"
FROM
    Relations.Order o
    JOIN Relations.salesman s ON o.salesman_id = s.salesman_id
WHERE
    o.salesman_id = 5001;

SELECT
    s.name as "Salesman Name"
FROM
    Relations.salesman s
    JOIN Relations.Customer c ON s.salesman_id = c.salesman_id
WHERE
    c.grade = (
        SELECT
            MIN(grade)
        FROM
            Relations.Customer
    );

SELECT
    COUNT(o.order_no) as "Total Order"
FROM
    Relations.Order o
    JOIN Relations.Customer c ON o.customer_id = c.customer_id
WHERE
    o.order_date BETWEEN '2016-09-05'
    AND '2016-10-17';