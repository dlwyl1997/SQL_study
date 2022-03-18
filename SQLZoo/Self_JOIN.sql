// 1.
SELECT COUNT(id)
FROM stops


// 2.
SELECT id
FROM stops
WHERE name = 'Craiglockhart'


// 3.
SELECT id, name
FROM stops JOIN route ON id = stop
WHERE num = '4'
AND company = 'LRT'


// 4.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2


// 5.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop = 53
AND b.stop = 149


// 6.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
             JOIN stops stopa ON (a.stop=stopa.id)
             JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name = 'Craiglockhart'
AND stopb.name = 'London Road'


// 7.
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = 115
AND b.stop = 137


// 8.
SELECT a.company, a.num
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
             JOIN stops sa ON (sa.id = a.stop)
             JOIN stops sb ON (sb.id = b.stop)
WHERE sa.name = 'Craiglockhart'
AND sb.name = 'Tollcross'


// 9.
SELECT sb.name, a.company, a.num
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
             JOIN stops sa ON (sa.id = a.stop)
             JOIN stops sb ON (sb.id = b.stop)
WHERE sa.name = 'Craiglockhart'


// 10.
SELECT a.num, a.company, sb.name, c.num, c.company
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
             JOIN route c ON (b.stop = c.stop)
             JOIN route d ON (c.company = d.company AND c.num = d.num)
             JOIN stops sa ON (sa.id = a.stop)
             JOIN stops sb ON (sb.id = b.stop)
             JOIN stops sc ON (sc.id = c.stop)
             JOIN stops sd ON (sd.id = d.stop)
WHERE sa.name = 'Craiglockhart'
AND sd.name = 'Lochend'
ORDER BY a.num, a.company, sb.name, c.num, c.company
