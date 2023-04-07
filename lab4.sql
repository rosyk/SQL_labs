SELECT UPPER(name) AS upper_name
FROM cities
ORDER BY name 
LIMIT 5 OFFSET 5;

SELECT name, LENGTH(name) AS name_length
FROM cities
WHERE LENGTH(name) NOT IN (8,9,10);

SELECT SUM(population) AS population_in_c_s
FROM cities
WHERE region IN ('C', 'S');

SELECT AVG(population) AS avg_population_in_w
FROM cities
WHERE region = 'W';

SELECT COUNT(name) AS cities_quantity
FROM cities
WHERE region = 'E'