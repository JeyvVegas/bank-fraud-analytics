SELECT
    type,
    COUNT(*) AS fraud_transactions,
    ROUND(SUM(amount), 2) AS fraud_amount
FROM fraud_raw
WHERE isFraud = 1
GROUP BY type
ORDER BY fraud_amount DESC;