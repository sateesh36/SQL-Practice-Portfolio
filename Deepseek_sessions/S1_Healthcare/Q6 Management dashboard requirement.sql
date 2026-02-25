Q6: Management dashboard requirement: For each department, show department name, department code, total service requests (both quarters), percentage of requests that were resolved, average satisfaction score (resolved requests only), total assets owned, percentage of assets needing repair, and classify overall department health as 'Excellent' if resolution rate > 80% AND asset repair rate < 20%, 'Good' if resolution rate > 60%, 'Needs Attention' otherwise.

-> SELECT 
    d.department_name,
    d.department_code,
    sr_metrics.total_requests,
    sr_metrics.resolution_percentage,
    sr_metrics.avg_satisfaction,
    asset_metrics.total_assets,
    asset_metrics.repair_percentage,
    CASE 
        WHEN sr_metrics.resolution_percentage > 80 AND asset_metrics.repair_percentage < 20 THEN 'Excellent'
        WHEN sr_metrics.resolution_percentage > 60 THEN 'Good'
        ELSE 'Needs Attention'
    END AS health_classification
FROM Departments d
LEFT JOIN (
    -- Service Request Metrics
    SELECT 
        s.assigned_department_id,
        COUNT(*) AS total_requests,
        ROUND(SUM(CASE WHEN s.resolution_date IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS resolution_percentage,
        ROUND(AVG(CASE WHEN s.resolution_date IS NOT NULL THEN s.satisfaction_score END), 2) AS avg_satisfaction
    FROM (
        SELECT * FROM ServiceRequests_Q1
        UNION ALL
        SELECT * FROM ServiceRequests_Q2
    ) s
    GROUP BY s.assigned_department_id
) sr_metrics ON d.department_id = sr_metrics.assigned_department_id
LEFT JOIN (
    -- Asset Metrics
    SELECT 
        a.owning_department_id,
        COUNT(*) AS total_assets,
        ROUND(SUM(CASE WHEN a.asset_status = 'Needs Repair' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS repair_percentage
    FROM Assets a
    GROUP BY a.owning_department_id
) asset_metrics ON d.department_id = asset_metrics.owning_department_id
