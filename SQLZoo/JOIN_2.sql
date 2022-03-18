// 1.
SELECT id, title
 FROM movie
 WHERE yr=1962
 
 
// 2.
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'


// 3.
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr


// 4.
SELECT id
FROM actor
WHERE name = 'Glenn Close'


// 5.
SELECT id
FROM movie
WHERE title = 'Casablanca'


// 6.
SELECT name
FROM casting JOIN actor ON (actorid=id)
WHERE movieid = 11768


// 7.
SELECT name
FROM casting JOIN actor ON (actorid = id)
WHERE movieid = (
    SELECT id
    FROM movie
    WHERE title = 'Alien'
)


// 8.
SELECT title
FROM casting JOIN movie ON (movieid = id)
WHERE actorid = (
    SELECT id
    FROM actor
    WHERE name = 'Harrison Ford'
)


// 9.
SELECT title
FROM casting JOIN movie ON (movieid = id)
WHERE actorid = (
    SELECT id
    FROM actor
    WHERE name = 'Harrison Ford'
)
AND ord <> 1


// 10.
SELECT title, name
FROM actor JOIN casting ON (actor.id = actorid)
JOIN movie ON (movie.id = movieid)
WHERE yr = 1962
AND ord = 1


// 11.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2


// 12.
SELECT title, name
FROM movie JOIN casting ON movie.id=movieid
           JOIN actor   ON actorid=actor.id
WHERE movieid IN (
    SELECT movieid FROM casting
    WHERE actorid IN (
        SELECT id FROM actor
        WHERE name='Julie Andrews'
    )
)
AND ord = 1


// 13.
SELECT name
FROM actor JOIN casting ON id = actorid
WHERE ord = 1
GROUP BY actorid, name
HAVING COUNT(name) >= 15
ORDER BY name


// 14.
SELECT title, COUNT(actorid)
FROM movie JOIN casting ON id = movieid
WHERE yr = 1978
GROUP BY movieid, title
ORDER BY COUNT(actorid) DESC, title


// 15.
SELECT DISTINCT name
FROM actor JOIN casting ON id = actorid
WHERE movieid IN (
    SELECT movieid
    FROM casting
    WHERE actorid = (
        SELECT id
        FROM actor
        WHERE name = 'Art Garfunkel'
    )
)
AND name <> 'Art Garfunkel'
