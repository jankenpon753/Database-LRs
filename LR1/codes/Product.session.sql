CREATE DATABASE Product;

use Product;

CREATE TABLE
    ProductInfo (
        Id int not null auto_increment primary key,
        Name varchar(30),
        OrderID int,
        Salesman varchar(20),
        Catagory varchar(20),
        Unit_Price int,
        Quantity int
    )
INSERT INTO
    ProductProductInfo (
        Name,
        OrderID,
        Salesman,
        Catagory,
        Unit_Price,
        Quantity
    )
VALUES
    ('Mouse', 123, 'Robert', 'Accessories', 2560.00, 3),
    (
        'Earphone',
        1253,
        'Robert',
        'Accessories',
        1560.00,
        2
    ),
    (
        'Keyboard',
        156,
        'Mark',
        'Accessories',
        4560.00,
        4
    ),
    (
        'Mousepad',
        1232,
        'John',
        'Accessories',
        560.00,
        2
    );

SELECT
    *
FROM
    Product.ProductInfo
where
    Salesman = 'Robert'