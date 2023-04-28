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