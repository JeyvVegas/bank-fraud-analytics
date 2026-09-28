SELECT ROUND(SUM(amount), 2) AS fraud_amount                                                            
FROM fraud_raw
WHERE isFraud = 1;