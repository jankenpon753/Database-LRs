CREATE DATABASE IF NOT EXISTS movie;

CREATE TABLE IF NOT EXISTS movie.movies(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50),
    director VARCHAR(50),
    year INT,
    length_minutes INT
);

CREATE TABLE movie.box_office(
    movie_id INT,
    rating DECIMAL(3, 1),
    domestic_sales BIGINT,
    international_sales BIGINT,
    CONSTRAINT box2movies FOREIGN KEY (movie_id) REFERENCES movie.movies(id)
);

INSERT INTO
    movie.movies (title, director, year, length_minutes)
VALUES
    ('Toy Story', 'John Lasseter', 1995, 81),
    ('A Bugs Life', 'John Lasseter', 1998, 95),
    ('Toy Story 2', 'John Lasseter', 1999, 93),
    ('Monsters, Inc.', 'Pete Docter', 2001, 92),
    ('Finding Nemo', 'Andrew Stanton', 2003, 107),
    ('The Incredibles', 'Brad Bird', 2004, 116),
    ('Cars', 'John Lasseter', 2006, 117),
    ('Ratatouille', 'Brad Bird', 2007, 115),
    ('WALL-E', 'Andrew Stanton', 2008, 104),
    ('Up', 'Pete Docter', 2009, 101),
    ('Toy Story 3', 'Lee Unkrich', 2010, 103),
    ('Cars 2', 'John Lasseter', 2011, 120),
    ('Brave', 'Brenda Chapman', 2012, 102),
    ('Monsters University', 'Dan Scanlon', 2013, 110);

INSERT INTO
    movie.box_office (
        movie_id,
        rating,
        domestic_sales,
        international_sales
    )
VALUES
    (5, 8.2, 380843261, 555900000),
    (14, 7.4, 268492764, 475066843),
    (8, 8, 206445654, 417277164),
    (12, 6.4, 191452396, 368400000),
    (3, 7.9, 245852179, 239163000),
    (6, 8, 261441092, 370001000),
    (9, 8.5, 223808164, 297503696),
    (11, 8.4, 415004880, 648167031),
    (7, 8.3, 191796233, 170162503),
    (10, 8.3, 293004164, 438338580),
    (4, 8.1, 289916256, 272900000),
    (2, 7.2, 162798565, 200600000),
    (13, 7.2, 237283207, 301700000);

SELECT
    title as Title,
    FORMAT(domestic_sales, 'N') as "Domestic Sales",
    FORMAT(international_sales, 'N') as "International Sales"
FROM
    movie.movies m
    JOIN movie.box_office b ON b.movie_id = m.id;

SELECT
    title as Title,
    FORMAT(domestic_sales, 'N') as "Domestic Sales",
    FORMAT(international_sales, 'N') as "International Sales"
FROM
    movie.movies m
    JOIN movie.box_office b ON b.movie_id = m.id
WHERE
    international_sales > domestic_sales;

SELECT
    title as Title,
    rating as Rating
FROM
    movie.movies m
    JOIN movie.box_office b ON b.movie_id = m.id
ORDER BY
    rating DESC;

SELECT
    m.id AS "Movie ID",
    m.title as Title,
    m.director as Director,
    m.length_minutes as "Length(Minutes)"
FROM
    movie.movies m
WHERE
    (m.director, m.length_minutes) IN (
        SELECT
            director,
            MAX(length_minutes) AS max_length
        FROM
            movie.movies
        GROUP BY
            director
    );

SELECT
    director as Director,
    FORMAT(SUM(domestic_sales), 'N') as "Total Domestic Sales"
FROM
    movie.movies m
    JOIN movie.box_office b ON m.id = b.movie_id
WHERE
    director = 'John Lasseter';