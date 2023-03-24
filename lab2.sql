SELECT name
FROM cities
WHERE population > 1000000;

SELECT name
FROM cities
WHERE region = 'E' OR region = 'W'
ORDER BY population DESC;

SELECT name
FROM cities
WHERE region IN ('S', 'C', 'N') AND population > 50000;

SELECT name
FROM cities
WHERE region IN ('E', 'W', 'N') AND population > 150000 AND population < 350000
ORDER BY name
LIMIT 20;

SELECT name
FROM cities
WHERE region NOT IN ('E', 'W')
ORDER BY population DESC
LIMIT 10 OFFSET 10;