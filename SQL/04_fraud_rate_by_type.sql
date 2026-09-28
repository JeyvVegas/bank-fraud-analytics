WITH transactions AS (
SELECT
	type,
	COUNT(*) AS count_transactions,
	SUM(CASE
		WHEN isFraud = 1 THEN 1
		ELSE 0
	END) AS fraud_transactions,
	SUM(CASE
		WHEN isFraud = 1 THEN amount
		ELSE 0
	END) AS fraud_amount
	FROM fraud_raw
GROUP BY type
)
SELECT 
	type,
	count_transactions,
	fraud_transactions,
	(fraud_transactions/NULLIF(count_transactions, 0)) * 100.0 AS fraud_rate,
	ROUND(fraud_amount, 2) AS fraud_amount
FROM transactions
ORDER BY fraud_rate DESC;