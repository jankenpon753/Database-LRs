-- prob1
SELECT
    *
FROM
    employees
WHERE
    reportsTo IS NULL;

--prob2
SELECT
    datediff(max(orderDate), min(orderDate))
FROM
    orders;

--prob3
SELECT
    sum(amount)
FROM
    payments
WHERE
    YEAR(paymentDate) = 2004
    and MONTH(paymentDate) = 7;

--prob4
SELECT
    concat(e.firstName, ' ', e.lastName),
    e.jobTitle,
    SUM(od.quantityOrdered *(od.priceEach - p.buyPrice)) AS totalProfit
FROM
    employees e
    JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
    JOIN orders o USING(customerNumber)
    JOIN orderdetails od USING(orderNumber)
    JOIN products p USING(productCode)
GROUP BY
    e.employeeNumber
ORDER BY
    SUM(od.quantityOrdered *(od.priceEach - p.buyPrice)) DESC;

--prob5
SELECT
    shippedDate,
    productCode,
    productName
FROM
    orders o
    JOIN orderdetails od USING(orderNumber)
    JOIN products p USING(productCode)
GROUP BY
    shippedDate,
    productCode,
    productName
HAVING
    YEAR(o.shippedDate) = 2003
ORDER BY
    shippedDate ASC;

--prob6#06
SELECT
    COUNT(orderNumber)
FROM
    orders
WHERE
    status = 'On Hold';

--prob7
SELECT
    productCode,
    priceEach,
    MSRP
FROM
    products
    JOIN orderdetails USING(productCode)
WHERE
    priceEach < 0.8 * MSRP