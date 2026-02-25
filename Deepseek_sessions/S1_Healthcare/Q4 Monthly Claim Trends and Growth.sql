Q4: Monthly Claim Trends and Growth (No Window Functions)
Analyze claim activity for the first five months of 2024 (January through May). For each month, calculate the number of claims filed and the total amount paid by insurance. Also compute the month-over-month percentage growth in total insurance paid compared to the previous month (for January, show NULL). Use derived tables or self-joins – do not use window functions (e.g., LAG). Format the month as YYYY-MM.
->SELECT 
    curr.month,
    curr.total_claims,
    curr.total_insurance_paid,
    CASE 
        WHEN prev.month_num IS NULL THEN NULL
        ELSE ((curr.total_insurance_paid - prev.total_insurance_paid) * 100.0 / NULLIF(prev.total_insurance_paid, 0))
    END AS growth_rate
FROM (
    SELECT 
        MONTH(claim_date) AS month_num,
        FORMAT(claim_date, 'yyyy-MM') AS month,
        COUNT(claim_id) AS total_claims,
        SUM(insurance_paid_amount) AS total_insurance_paid
    FROM PharmacyClaims
    WHERE claim_date >= '2024-01-01' AND claim_date < '2024-06-01'
    GROUP BY MONTH(claim_date), FORMAT(claim_date, 'yyyy-MM')
) curr
LEFT JOIN (
    SELECT 
        MONTH(claim_date) AS month_num,
        COUNT(claim_id) AS total_claims,
        SUM(insurance_paid_amount) AS total_insurance_paid
    FROM PharmacyClaims
    WHERE claim_date >= '2024-01-01' AND claim_date < '2024-06-01'
    GROUP BY MONTH(claim_date)
) prev 
    ON curr.month_num = prev.month_num + 1
ORDER BY curr.month_num