CREATE TABLE fraud_clean AS
SELECT
	step,
	type,
	CAST(amount AS DECIMAL(18,2))          AS amount,
	nameOrig,
	CAST(oldbalanceOrg AS DECIMAL(18,2))   AS oldbalanceOrg,
	CAST(newbalanceOrig AS DECIMAL(18,2))  AS newbalanceOrig,
	nameDest,
	CAST(oldbalanceDest AS DECIMAL(18,2))  AS oldbalanceDest,
	CAST(newbalanceDest AS DECIMAL(18,2))  AS newbalanceDest,
    isFraud,
    isFlaggedFraud
FROM fraud_raw;
	
	