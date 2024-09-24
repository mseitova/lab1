CREATE DATABASE lab2;

CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INT,
    population INT
);

INSERT INTO countries (country_id, country_name, region_id, population)
VALUES (1, 'Canada', 1, 222212122);

INSERT INTO countries (country_id, country_name)
VALUES (2, 'USA');

INSERT INTO countries (country_id, country_name, region_id, population)
VALUES (3, 'Poland', NULL, 19200000);

INSERT INTO countries (country_id, country_name, region_id, population)
VALUES
  (4, 'Mexico', 2, 128932753),
  (5, 'Brazil', 3, 212559417),
  (6, 'Argentina', 3, 45195774);

ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_id, region_id, population)
VALUES (7, 4, 18776707);

INSERT INTO countries (country_name, region_id, population) VALUES (DEFAULT, DEFAULT, DEFAULT);


INSERT INTO countries DEFAULT VALUES;


CREATE TABLE countries_new(LIKE countries);


INSERT INTO countries_new
    SELECT * FROM countries;


UPDATE countries SET region_id = 1
    WHERE countries.region_id IS NULL;


UPDATE countries SET population = population * 1.1
    WHERE population IS NOT NULL
    RETURNING country_name, population AS "New Population";


DELETE FROM countries
    WHERE population < 100000;


DELETE FROM countries_new
    WHERE country_id IN (SELECT country_id FROM countries)
    RETURNING *;

DELETE FROM countries
    RETURNING *;