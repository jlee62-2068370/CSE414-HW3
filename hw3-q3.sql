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
	AS FLOAT), 2) AS 'percentage'
FROM flights f
LEFT JOIN fl_tot ON f.origin_city = fl_tot.origin_city
GROUP BY f.origin_city, fl_tot.tot_count
ORDER BY 'percentage' ASC;

-- Total outputted rows: 327
-- Total time: 00:00:10.736

/* First 20 rows:
origin_city	        percentage
Pago Pago TT	      0
Guam TT	            0
Aguadilla PR	      28.68
Anchorage AK	      31.66
San Juan PR	        33.54
Charlotte Amalie VI	39.27
Ponce PR	          40.32
Fairbanks AK	      49.54
Kahului HI	        53.34
Honolulu HI	        54.53
San Francisco CA	  55.22
Los Angeles CA	    55.41
Seattle WA	        57.41
New York NY	        60.53
Long Beach CA	      61.72
Kona HI	            62.95
Newark NJ	          63.37
Plattsburgh NY	    64
Las Vegas NV	      64.47
Christiansted VI	  64.67
*/