/*
Problem: Weather Observation Station <Number>

Concepts Used:
- DISTINCT
- WHERE filtering
- String conditions

Explanation:
Retrieved Unique city name by distinct and applying even number condition i.e. %2=0 (this will see if the id is divisible by 2 if it then its even else odd)
*/
SELECT DISTINCT(CITY)
FROM STATION
WHERE ID % 2 = 0;
