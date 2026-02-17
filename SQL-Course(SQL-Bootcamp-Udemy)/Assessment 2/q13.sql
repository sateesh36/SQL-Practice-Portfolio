SELECT starttime AS start, name 
FROM cd.bookings
JOIN cd.facilities
ON bookings.facid = facilities.facid
WHERE name LIKE 'Tennis Court%'
AND DATE(starttime) = '2012-09-21'
ORDER BY starttime ASC;