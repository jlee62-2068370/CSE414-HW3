SELECT DISTINCT fl.dest_city AS city
FROM flights fl
WHERE fl.origin_city != 'Seattle WA'
AND fl.dest_city != 'Seattle WA'
AND fl.dest_city NOT IN (
  SELECT fl2.dest_city
  FROM flights fl1, flights fl2
  WHERE fl1.origin_city = 'Seattle WA' 
  AND fl2.origin_city = fl1.dest_city
  AND fl2.dest_city = fl.dest_city
)
ORDER BY city ASC;

-- Total outputted rows: 3
-- Total time: 00:01:24
/*
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
*/