
SELECT 
    COUNT(*)    AS count_transactions,
    SUM(amount) AS fraud_sum
FROM fraud_clean
WHERE isFraud = 1;


SELECT 
    nameOrig,
    COUNT(*) AS fraud_transactions
FROM fraud_clean
WHERE isFraud = 1
GROUP BY nameOrig
ORDER BY fraud_transactions DESC;