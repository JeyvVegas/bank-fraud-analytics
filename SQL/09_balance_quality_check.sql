WITH check_balance AS (
SELECT
	type,
	CASE
		WHEN type = 'CASH_IN' THEN oldbalanceOrg + amount
		ELSE oldbalanceOrg - amount
	END AS expected_newbalanceOrig,
	newbalanceOrig
	FROM fraud_raw
), check_balance2 AS (
SELECT
    type,
    COUNT(*) AS count_transactions,
	SUM(CASE 
		WHEN ABS(ROUND((expected_newbalanceOrig - newbalanceOrig) * 100, 0)) > 1 THEN 1
		ELSE 0
	END) balance_mismatch_count 
	FROM check_balance
	group by type
)
SELECT type, count_transactions, balance_mismatch_count, ROUND((balance_mismatch_count/NULLIF(count_transactions, 0)) * 100.0, 2) AS balance_mismatch_rate
FROM check_balance2
ORDER BY balance_mismatch_rate DESC;