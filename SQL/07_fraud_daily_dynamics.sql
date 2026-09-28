SELECT 
	CEIL(step / 24.0) AS day, 
	COUNT(*) AS fraud_transactions,
	ROUND(SUM(amount), 2) AS fraud_amount
FROM fraud_raw
WHERE isFraud = 1
GROUP BY CEIL(step / 24.0)
ORDER BY day ASC;