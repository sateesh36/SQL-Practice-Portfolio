Q1: Patient Medication Activity Report
Prepare a report that lists each patient with their full name, age, insurance status (insured or uninsured), and their medication activity: the number of distinct medications they have been prescribed and the total number of pharmacy claims they have filed. Sort the list so that the most active patients (by total claims) appear first.

->SELECT 
    p.first_name + ' ' + p.last_name AS Full_name, --Full_name
    DATEDIFF(YEAR, p.date_of_birth, '2024-06-01') --check Difference
        - CASE 
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, p.date_of_birth, '2024-06-01'), p.date_of_birth) > '2024-06-01' 
            THEN 1 /* Then check if adding that many years to dob gives a date AFTER the cutoff - If yes Sub 1 Else 0*/
            ELSE 0 
          END AS Age, 
    COUNT(DISTINCT ps.medication_id) AS Total_medicine_count,
    COUNT(pc.claim_id) AS Total_phar_count,
    CASE WHEN p.insurance_id IS NOT NULL THEN 'Insured' ELSE 'Uninsured' END AS Insurance
FROM Patients p
LEFT JOIN Prescriptions ps ON p.patient_id = ps.patient_id
LEFT JOIN PharmacyClaims pc ON ps.prescription_id = pc.prescription_id
GROUP BY p.patient_id, p.first_name, p.last_name, p.date_of_birth, p.insurance_id
ORDER BY Total_phar_count DESC

