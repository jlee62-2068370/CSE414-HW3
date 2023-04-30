
WITH connected AS (
  SELECT DISTINCT fl2.dest_city
  FROM flights fl1
  JOIN flights fl2 ON fl1.dest_city = fl2.origin_city
  WHERE fl1.origin_city = 'Seattle WA'
  AND fl1.dest_city != fl2.dest_city
)
SELECT DISTINCT fl.dest_city AS city
FROM flights fl
JOIN connected ON fl.origin_city = connected.dest_city
WHERE fl.dest_city != 'Seattle WA'
ORDER BY city ASC;

-- Total rows outputted: 325
-- Total time: 00:00:11.800

/* First 20 rows:
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Albuquerque NM
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Anchorage AK
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlanta GA
Atlantic City NJ
*/