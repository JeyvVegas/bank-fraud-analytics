SELECT 
	COUNT(DISTINCT(nameOrig)) AS unique_fraud_senders
FROM fraud_clean
WHERE isFraud = 1;