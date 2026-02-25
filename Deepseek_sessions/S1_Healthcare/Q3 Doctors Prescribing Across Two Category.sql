Q3: Doctors Prescribing Across Two Categories
Identify doctors who have written at least one prescription for an antibiotic and at least one for a cardiovascular medication. For each such doctor, provide their full name, specialty, and the count of prescriptions they have written for each of those two categories. Order the results by the total number of prescriptions across both categories (highest first).
->SELECT total.doctor_id,total.Full_name,total.specialty,total.Total_pre_count_anti,total.Total_pre_count_cardi
FROM(	
	SELECT 
		d.doctor_id,
		d.first_name + ' ' + d.last_name AS Full_name,
		d.specialty, 
		SUM(CASE WHEN m.category = 'Antibiotic' THEN 1 ELSE 0 END) AS Total_pre_count_anti,
		SUM(CASE WHEN m.category = 'Cardiovascular' THEN 1 ELSE 0 END) AS Total_pre_count_cardi
	FROM Doctors d
	INNER JOIN Prescriptions p
	ON d.doctor_id = p.doctor_id
	INNER JOIN Medications m
	ON p.medication_id = m.medication_id
	GROUP BY d.doctor_id,d.first_name + ' ' + d.last_name,d.specialty
	HAVING SUM(CASE WHEN m.category = 'Antibiotic' THEN 1 ELSE 0 END) >=1 AND
		   SUM(CASE WHEN m.category = 'Cardiovascular' THEN 1 ELSE 0 END)>=1)total /* Used flag to find at least 1 antibiotic AND  cardiovascular..qst condition sees if there is 1 or more in flag if yes return and same for 2nd condition )*/
ORDER BY total.Total_pre_count_anti + total.Total_pre_count_cardi DESC
