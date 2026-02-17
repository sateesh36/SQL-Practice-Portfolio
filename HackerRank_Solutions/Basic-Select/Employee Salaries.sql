/*
Problem: Employee Salaries > 2000 And working for 10 months.

Explanation:
Retrieved name whose salary is greater than 2000 (>) and month is within 10 months. AND operator will tell both condition should be meet
*/

SELECT name FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC