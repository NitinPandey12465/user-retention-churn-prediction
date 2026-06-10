
SELECT 
    COUNT(b.customer_id) AS high_risk_customers,
    ROUND(SUM(b.monthly_charges)::numeric, 2) AS monthly_revenue_at_risk
FROM fact_billing b
JOIN dim_contracts c ON b.customer_id = c.customer_id
JOIN dim_services s  ON b.customer_id = s.customer_id
WHERE 
    c.contract = 'Month-to-month'
    AND s.internet_service = 'Fiber optic'
    AND b.tenure < 12
    AND b.churn = 'Yes';