/*
Problem: Find the difference between the total number of CITY entries and the number of distinct CITY entries in the table

Explanation:
Retrieved the differences between All city entries and distinct city this will help to determine how may duplicate are there in the city column.
*/
SELECT COUNT(CITY)-COUNT(DISTINCT CITY)
FROM STATION
