Q2: Insurance Plan Financial and Denial Analysis
For every insurance plan offered (including those that have never been used), evaluate their financial performance and claim denial rate. Calculate the total amount paid by the insurance company, the total copays paid by patients, and the percentage of claims that were denied. Based on the denial rate, classify each plan as Low (denial rate < 5%), Medium (5%–15%), High (>15%), or No Claims if there are no claims associated with that plan. For plans with a missing name, display a placeholder like 'Unknown Plan'. Ensure division by zero is handled properly.

->SELECT total.plan_name,total.Total_paid,total.Total_Copaid,total.Denied_per,
CASE 
	WHEN total.Denied_per < 5 THEN 'Low'
	WHEN total.Denied_per BETWEEN 5 AND 15 THEN 'Medium'
	WHEN total.Denied_per >  15 THEN 'High'
	ELSE 'No claims' 
END AS Classification 
FROM(
SELECT COALESCE(i.plan_name,'Unknown Plan') AS plan_name, /*COALESCE For null handling*/
	SUM(CASE WHEN pc.status = 'Paid' THEN pc.insurance_paid_amount ELSE 0 END) AS Total_paid,  /*Sums only that insurance comp paid.*/ 
	SUM(CASE WHEN pc.status = 'Paid' THEN pc.copay_amount ELSE 0 END) AS Total_Copaid,
	SUM(CASE WHEN pc.status = 'Denied' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(pc.claim_id),0) AS  Denied_per /*Denied % */
FROM InsurancePlans i
LEFT JOIN Patients p
ON i.insurance_id = p.insurance_id
LEFT JOIN Prescriptions ps
ON p.patient_id = ps.patient_id
LEFT JOIN PharmacyClaims pc
ON ps.prescription_id = pc.prescription_id
	GROUP BY i.insurance_id,COALESCE(i.plan_name,'Unknown Plan') /*insurance id make sure that any null in plan name don't mixes up*/

	)total

