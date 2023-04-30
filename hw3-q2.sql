SELECT DISTINCT fl.origin_city AS city
FROM flights fl
JOIN (
  SELECT origin_city, max(actual_time) AS maximum_time
  FROM flights
  GROUP BY origin_city
) AS fl2
ON fl2.origin_city = fl.origin_city
AND fl.actual_time = fl2.maximum_time
WHERE fl.actual_time < 180 AND fl.canceled = 0
ORDER BY city ASC;

-- Total outputted rows: 109
-- Total time: 00:00:05.799
/* First 20 rows
city
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
*/