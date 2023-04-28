
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