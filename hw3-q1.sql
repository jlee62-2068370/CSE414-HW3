SELECT DISTINCT fl.origin_city, fl.dest_city, fl.actual_time AS time
FROM flights fl
JOIN (
  SELECT origin_city, max(actual_time) AS maximum_time
  FROM flights
  GROUP BY origin_city
) AS fl2
ON fl2.origin_city = fl.origin_city
AND fl.actual_time = fl2.maximum_time
ORDER BY fl.origin_city ASC, fl.dest_city ASC;

-- Total outputted rows: 334
-- Total time: 00:00:03.232

/* First 20 rows
origin_city	dest_city	time
Aberdeen SD	Minneapolis MN	106
Abilene TX	Dallas/Fort Worth TX	111
Adak Island AK	Anchorage AK	471
Aguadilla PR	New York NY	368
Akron OH	Atlanta GA	408
Albany GA	Atlanta GA	243
Albany NY	Atlanta GA	390
Albuquerque NM	Houston TX	492
Alexandria LA	Atlanta GA	391
Allentown/Bethlehem/Easton PA	Atlanta GA	456
Alpena MI	Detroit MI	80
Amarillo TX	Houston TX	390
Anchorage AK	Barrow AK	490
Appleton WI	Atlanta GA	405
Arcata/Eureka CA	San Francisco CA	476
Asheville NC	Chicago IL	279
Ashland WV	Cincinnati OH	84
Aspen CO	Los Angeles CA	304
Atlanta GA	Honolulu HI	649
Atlantic City NJ	Fort Lauderdale FL	212
*/