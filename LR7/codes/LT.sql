SELECT
    order_no as "Order No",
    order_date as "Order Date",
    purchase_amount as "Purchase Amount"
FROM
    Relations.Order
WHERE
    salesman_id = 5001
SELECT
    c.customer_name as "Customer Name",
    o.purchase_amount as "Purchase Amount"
from
    Relations.Customer c,
    Relations.Order o
WHERE
    c.customer_id = (
        SELECT
            customer_id
        FROM
            Relations.Order o
        WHERE
            purchase_amount = (
                SELECT
                    min(purchase_amount)
                FROM
                    Relations.Order
            )
    )
    AND purchase_amount = (
        SELECT
            min(purchase_amount)
        FROM
            Relations.Order
    )
SELECT
    salesman_id as "Salesman ID",
    name as "Salesman Name",
    city as "City",
    commission as "Commission"
FROM
    Relations.salesman
WHERE
    commission >= 0.12
    AND commission <= 0.14
SELECT
    sum(purchase_amount) as "Total Purchased Amount"
FROM
    Relations.Order
SELECT
    MAX(purchase_amount) as "Max Purchased Amount",
    salesman_id as "Salesman ID",
    order_date as "Order Date"
FROM
    Relations.Order
WHERE
    order_date = "2016-08-17"
GROUP BY
    salesman_id
SELECT
    order_no as "Order No",
    purchase_amount as "Purchase Amount",
    order_date as "Order Date",
    customer_id as "Customer ID",
    salesman_id as "Salesman ID"
FROM
    Relations.Order
WHERE
    salesman_id = (
        SELECT
            salesman_id
        from
            Relations.salesman
        WHERE
            name = 'Paul Adam'
    ) -- UPDATE
    --     --     Relations.Order
    --     -- SET
    --     --     order_date = '2013-10-17'
    --     -- WHERE
    --     --     purchase_amount > 1000
    --     --     and purchase_amount < 2500
    --     -- UPDATE
    --     --     Relations.salesman
    --     -- SET
    --     --     name = 'Paul Adam'
    --     -- WHERE
    --     --     salesman_id = 5007