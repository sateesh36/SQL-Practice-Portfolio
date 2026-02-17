SELECT starttime, firstname || ' ' || surname AS members
FROM cd.bookings
JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE firstname = 'David' AND surname = 'Farrell';