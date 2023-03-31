SELECT name
FROM cities
WHERE name LIKE '%ськ';

SELECT name
FROM cities
WHERE name LIKE '%донец%';

SELECT Concat(name,' (',region,')') AS region_name
FROM cities
WHERE population > 100000
ORDER BY region_name;

SELECT name, Concat(population/40000000*100, '%') AS population_percent
FROM cities
ORDER BY population DESC
LIMIT 50;

SELECT Concat(name, ' - ', population/40000000*100, '%') AS name_population_percent
FROM cities
WHERE population/40000000*100 > 0.1
ORDER BY population/40000000*100 DESC;