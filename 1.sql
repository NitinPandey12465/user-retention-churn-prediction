
SELECT 
    c.contract,
    COUNT(b.customer_id) AS total_customers,
    SUM(CASE WHEN b.churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(
        SUM(CASE WHEN b.churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS churn_rate_pct
FROM dim_contracts c
JOIN fact_billing b ON c.customer_id = b.customer_id
GROUP BY c.contract
ORDER BY churn_rate_pct DESC;