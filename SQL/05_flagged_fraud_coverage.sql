WITH flagged_tr AS (
SELECT
	type,
	SUM(CASE
		WHEN isFraud = 1 THEN 1
		ELSE 0
	END) AS fraud_transactions,
	SUM(CASE
		WHEN isFlaggedFraud = 1 THEN 1
		ELSE 0
	END) AS flagged_transactions,
	SUM(CASE
		WHEN isFraud = 1 AND isFlaggedFraud = 1 THEN 1 
		ELSE 0
	END) AS fraud_flagged
FROM fraud_raw
GROUP BY type	
)
SELECT 
	type, 
	fraud_transactions, 
	flagged_transactions,
	fraud_flagged,
	COALESCE(ROUND((fraud_flagged/NULLIF(fraud_transactions, 0)) * 100.0, 2), 0) AS fraud_coverage_rate
FROM flagged_tr
ORDER BY fraud_coverage_rate DESC;
	
	
	