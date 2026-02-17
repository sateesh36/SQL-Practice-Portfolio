SELECT facid, SUM(slots) AS "Total slots"
FROM cd.bookings
WHERE EXTRACT(MONTH FROM starttime) = 09
GROUP BY facid
ORDER BY SUM(slots);