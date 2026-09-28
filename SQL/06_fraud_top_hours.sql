SELECT 
	step AS simulation_hour,
	CEIL(step / 24.0) AS simulation_day,
	MOD(step - 1, 24) + 1 AS hour_in_day,
	COUNT(*) AS fraud_transactions,
	ROUND(SUM(amount), 2) AS fraud_amount
FROM fraud_raw
WHERE isFraud = 1
GROUP BY step
ORDER BY fraud_amount DESC
LIMIT 10;