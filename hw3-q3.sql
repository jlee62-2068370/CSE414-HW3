WITH fl_tot AS (
  SELECT fl.origin_city, count(fid) AS tot_count
  FROM flights fl
  WHERE (fl.canceled = 0
  AND actual_time < 180.0)
  OR (fl.actual_time IS NULL)
  GROUP BY fl.origin_city
)
SELECT f.origin_city,
  ROUND(CAST(fl_tot.tot_count AS FLOAT) * 100/ CAST(count(f.fid)
	AS FLOAT), 2) AS 'percent'
FROM flights f
LEFT JOIN fl_tot ON f.origin_city = fl_tot.origin_city
GROUP BY f.origin_city, fl_tot.tot_count
ORDER BY 'percent' ASC;

-- Total outputted rows: 327