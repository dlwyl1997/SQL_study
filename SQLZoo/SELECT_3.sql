// 1.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 
 
 // 2.
 SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 
 
 // 3.
 SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'


// 4.
SELECT winner
FROM nobel
WHERE yr >= 2000
AND subject = 'Peace'


// 5.
SELECT *
FROM nobel
WHERE subject = 'Literature'
AND yr BETWEEN 1980 AND 1989


// 6.
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')


// 7.
SELECT winner
FROM nobel
WHERE winner LIKE 'John %'


// 8.
SELECT *
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980)
OR (subject = 'Chemistry' AND yr = 1984)


// 9.
SELECT *
FROM nobel
WHERE yr = 1980
AND subject NOT IN ('Chemistry', 'Medicine')


// 10.
SELECT *
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910)
OR (subject = 'Literature' AND yr >= 2004)


// 11.
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'


// 12.
SELECT *
FROM nobel
WHERE winner = 'EUGENE O\'NEILL'


// 13.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir %'
ORDER BY yr DESC, winner


// 14.
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject,winner
