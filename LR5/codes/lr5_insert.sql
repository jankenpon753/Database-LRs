INSERT INTO
    Relations.salesman (salesman_id, name, city, commission)
VALUES
    (
        5001,
        'James Hoog',
        'New York',
        0.15
    ),
    (
        5002,
        'Nail Knite',
        'Paris',
        0.13
    ),
    (
        5003,
        'Lauson Hen',
        null,
        0.12
    ),
    (
        5005,
        'Pit Alex',
        'London',
        0.11
    ),
    (
        5006,
        'Mc Lyon',
        'New York',
        0.14
    ),
    (
        5007,
        'Pal Adam',
        'Rome',
        0.13
    );

--
INSERT INTO
    Relations.Customer (
        customer_id,
        customer_name,
        city,
        grade,
        salesman_id
    )
VALUES
    (
        3001,
        'Brad Guzan',
        'London',
        null,
        null
    ),
    (
        3002,
        'Nick Romando',
        'New York',
        100,
        5001
    ),
    (
        3003,
        'Jozy Altidor',
        'Moscow',
        200,
        5007
    ),
    (
        3004,
        'Fabian Johnson',
        'Paris',
        300,
        5006
    ),
    (
        3005,
        'Graham Zusi',
        'California',
        200,
        5002
    ),
    (
        3007,
        'Brad Davis',
        'New York',
        200,
        5001
    ),
    (
        3008,
        'Julian Green',
        'London',
        300,
        5002
    ),
    (
        3009,
        'Geoff Cameron',
        'Berlin',
        100,
        null
    );

--
INSERT INTO
    Relations.Order (
        order_no,
        purchase_amount,
        order_date,
        customer_id,
        salesman_id
    )
VALUES
    (
        70001,
        150.5,
        '2012-10-05',
        3005,
        5002
    ),
    (70002, 65.26, '2016-10-05', 3002, 5001),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70013, 3045.6, '2012-04-25', 3002, 5001);