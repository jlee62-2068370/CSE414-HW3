SELECT DISTINCT ca.name AS carrier
FROM carriers ca
JOIN (
  SELECT carrier_id
  FROM flights
  WHERE origin_city = 'Seattle WA'
  AND dest_city = 'San Francisco CA'
) AS fl
ON fl.carrier_id = ca.cid
ORDER BY carrier ASC;

-- Total rows outputted: 4
-- Total time: 00:00:00.050
/*
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/