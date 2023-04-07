SELECT region, SUM(population) AS region_population
FROM cities
GROUP BY region;

SELECT region, SUM(population) AS region_population
FROM cities
GROUP BY region
HAVING COUNT(name) >= 10;

SELECT name, population
FROM cities
WHERE region IN (SELECT uuid
                  FROM regions
                  WHERE area_quantity >= 5) 
ORDER BY population DESC
LIMIT 5 OFFSET 10;

SELECT region, SUM(population) as total_population
FROM cities
WHERE population > 300000
GROUP BY region;

SELECT name, 
       (SELECT SUM(population) 
        FROM cities 
        WHERE region = regions.uuid AND population > 300000) as total_population
FROM regions;

SELECT name, population
FROM cities
WHERE region IN (SELECT uuid 
                  FROM regions
                  WHERE area_quantity <= 5)
AND population NOT BETWEEN 150000 AND 500000
