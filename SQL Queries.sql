-- Total Loan Applications
SELECT COUNT(id) AS total_applications FROM financial_loan;

-- Total Funded Amount
SELECT SUM(loan_amount) AS total_funded_amount FROM financial_loan;

-- Total Amount Received
SELECT SUM(total_payment) AS total_amount_received FROM financial_loan;

-- Average Interest Rate and DTI
SELECT 
    ROUND(AVG(int_rate)::NUMERIC * 100, 2) AS avg_interest_rate,
    ROUND(AVG(dti)::NUMERIC * 100, 2) AS avg_dti
FROM financial_loan;


-- Loan Status Breakdown
SELECT 
    loan_status,
    COUNT(id) AS total_loans,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received,
    ROUND(SUM(total_payment)/SUM(loan_amount)*100,2) AS recovery_rate
FROM financial_loan
GROUP BY loan_status
ORDER BY total_loans DESC;

--Monthly Loan Trend
SELECT
    TO_CHAR(issue_date, 'YYYY-MM') AS month,
    COUNT(id) AS applications,
    SUM(loan_amount) AS funded,
    SUM(total_payment) AS received
FROM financial_loan
GROUP BY month
ORDER BY month;

--Grade Analysis
SELECT 
    grade,
    COUNT(id) AS total_loans,
    ROUND((AVG(int_rate)::NUMERIC*100),2) AS avg_interest_rate,
    ROUND((AVG(dti)::NUMERIC*100),2) AS avg_dti,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM financial_loan
GROUP BY grade
ORDER BY grade;


--Home Ownership Performance
SELECT 
    home_ownership,
    COUNT(id) AS total_loans,
    ROUND(AVG(loan_amount)) AS avg_loan,
    ROUND((AVG(int_rate)::NUMERIC * 100), 2) AS avg_interest_rate,
    ROUND((SUM(total_payment)::NUMERIC / SUM(loan_amount)) * 100, 2) AS recovery_rate
FROM financial_loan
GROUP BY home_ownership
ORDER BY total_loans DESC;

--Purpose-Based Portfolio Split
SELECT 
    purpose,
    COUNT(id) AS total_loans,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received,
    ROUND((AVG(int_rate)::NUMERIC * 100), 2) AS avg_int_rate
FROM financial_loan
GROUP BY purpose
ORDER BY total_loans DESC;




--Yearly Default Trend
SELECT 
    EXTRACT(YEAR FROM issue_date) AS year,
    COUNT(CASE WHEN loan_status = 'Charged Off' THEN 1 END) AS defaults,
    COUNT(id) AS total_loans,
    ROUND((COUNT(CASE WHEN loan_status = 'Charged Off' THEN 1 END)::NUMERIC / COUNT(id)) * 100, 2) AS default_rate
FROM financial_loan
GROUP BY year
ORDER BY year;

--Verification Status Performance
SELECT 
    verification_status,
    COUNT(id) AS total_loans,
    ROUND((AVG(int_rate)::NUMERIC * 100), 2) AS avg_int_rate,
    ROUND((AVG(dti)::NUMERIC * 100), 2) AS avg_dti,
    ROUND((SUM(total_payment)::NUMERIC / SUM(loan_amount)) * 100, 2) AS recovery_rate
FROM financial_loan
GROUP BY verification_status
ORDER BY total_loans DESC;

--Data Quality Check
-- Missing IDs
SELECT COUNT(*) AS missing_id_count FROM financial_loan WHERE id IS NULL;

-- Invalid Dates
SELECT COUNT(*) AS invalid_dates FROM financial_loan WHERE issue_date IS NULL;

-- Negative Loan Amounts
SELECT COUNT(*) AS negative_loans FROM financial_loan WHERE loan_amount <= 0;





