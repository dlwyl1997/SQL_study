// 1.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
      
     
// 2.
SELECT name
FROM world
WHERE continent = 'Europe'
AND gdp/population > (
    SELECT gdp/population
    FROM world
    WHERE name = 'United Kingdom'
)


// 3.
SELECT name, continent FROM world
WHERE continent IN (
    SELECT continent FROM world
    WHERE name IN ('Argentina', 'Australia')
)
ORDER BY name


// 4.
SELECT name, population FROM world
WHERE population > (
    SELECT population FROM world
    WHERE name = 'Canada'
)
AND population < (
    SELECT population FROM world
    WHERE name = 'Poland'
)


// 5.
SELECT name, CONCAT(ROUND(population/(
    SELECT population FROM world
    WHERE name = 'Germany'
)*100, 0), '%')
FROM world
WHERE continent = 'Europe'


// 6.
SELECT name FROM world
WHERE gdp > (
    SELECT MAX(gdp) FROM world
    WHERE continent = 'Europe'
    AND gdp > 0
)


// 7.
SELECT continent, name, area FROM world x
  WHERE area >=
    (SELECT MAX(area) FROM world y
     WHERE y.continent=x.continent
     AND area>0)
     
     
// 8.
SELECT continent, name FROM world x
WHERE name = (
    SELECT MIN(name) FROM world y
    WHERE x.continent = y.continent
)


// 9.
SELECT name, continent, population FROM world x
WHERE (
    SELECT MAX(population) FROM world y
    WHERE x.continent = y.continent
) <= 25000000


// 10.
SELECT name, continent FROM world x
WHERE
    x.population > (
    SELECT MAX(population) FROM world y
    WHERE x.continent = y.continent
    AND x.name <> y.name) * 3
