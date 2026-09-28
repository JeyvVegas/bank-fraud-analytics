WITH amount_b AS (
SELECT
	COUNT(*) AS count_transactions,
	SUM(CASE
		WHEN isFraud = 1 THEN 1
		ELSE 0
	END) AS fraud_transactions,
	ROUND(SUM(CASE
		WHEN isFraud = 1 THEN amount
		ELSE 0
	END), 2) AS fraud_amount,	
	CASE 
		WHEN amount < 10000  THEN 'до 10,000'
		WHEN amount < 100000 THEN '10,000–99,999.99'
		WHEN amount < 500000 THEN '100,000–499,999.99'
		ELSE '500,000 и выше'
	END AS amount_band 
FROM fraud_raw
GROUP BY amount_band
)
SELECT 
	count_transactions,
	fraud_transactions,
	ROUND((fraud_transactions/NULLIF(count_transactions, 0)) * 100.0, 2) AS fraud_rate,
	fraud_amount,
	amount_band
FROM amount_b
ORDER BY CASE amount_band
    WHEN 'до 10,000'          THEN 1
    WHEN '10,000–99,999.99'   THEN 2
    WHEN '100,000–499,999.99' THEN 3
    WHEN '500,000 и выше'     THEN 4
END;