SELECT DISTINCT ca.name AS carrier
FROM carriers ca
JOIN flights fl ON ca.cid = fl.carrier_id
WHERE fl.origin_city = 'Seattle WA'
AND fl.dest_city = 'San Francisco CA'
ORDER BY carrier ASC;

-- Total rows outputted: 4
-- Total time: 00:00:00.038
/*
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/