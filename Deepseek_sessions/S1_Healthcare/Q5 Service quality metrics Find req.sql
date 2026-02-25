Q5: Service quality metrics: Find request types that appeared in both Q1 and Q2. For these recurring request types, show the request type name, total count across both quarters, and calculate whether response time improved, worsened, or stayed the same from Q1 to Q2 (compare average days to resolution). Show 'Improved' if Q2 average is at least 20% faster than Q1, 'Worsened' if Q2 is slower, or 'Stable' otherwise.
->SELECT 
    t.request_type,
    t.total_count,
    t.avg_q1_days,
    t.avg_q2_days,
    CASE
        WHEN t.avg_q2_days <= t.avg_q1_days * 0.8 THEN 'Improved'  -- Q2 is 20%+ faster
        WHEN t.avg_q2_days > t.avg_q1_days THEN 'Worsened'         -- Q2 is slower
        ELSE 'Stable'                                               -- Q2 similar to Q1
    END AS performance_trend
FROM (
    SELECT 
        recurring.request_type,
        COUNT(*) AS total_count,
        AVG(CASE WHEN q1.request_id IS NOT NULL AND q1.resolution_date IS NOT NULL 
                 THEN DATEDIFF(DAY, q1.submitted_date, q1.resolution_date) END) AS avg_q1_days,
        AVG(CASE WHEN q2.request_id IS NOT NULL AND q2.resolution_date IS NOT NULL 
                 THEN DATEDIFF(DAY, q2.submitted_date, q2.resolution_date) END) AS avg_q2_days
    FROM (
        SELECT request_type FROM ServiceRequests_Q1
        INTERSECT
        SELECT request_type FROM ServiceRequests_Q2
    ) recurring
    LEFT JOIN ServiceRequests_Q1 q1 ON recurring.request_type = q1.request_type
    LEFT JOIN ServiceRequests_Q2 q2 ON recurring.request_type = q2.request_type
    GROUP BY recurring.request_type
) t