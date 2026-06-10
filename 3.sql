SELECT 
    b.customer_id,
    c.contract,
    b.tenure,
    b.monthly_charges,
    RANK() OVER (
        PARTITION BY c.contract 
        ORDER BY b.tenure DESC
    ) AS tenure_rank
FROM fact_billing b
JOIN dim_contracts c ON b.customer_id = c.customer_id
ORDER BY c.contract, tenure_rank
LIMIT 20;