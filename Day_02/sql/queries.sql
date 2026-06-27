-- ===================================================
-- 1. Top 5 Funds by AUM
-- ===================================================
SELECT *
FROM fact_aum
ORDER BY aum DESC
LIMIT 5;

-- ===================================================
-- 2. Average NAV per Month
-- ===================================================
SELECT
strftime('%Y-%m', date) AS month,
AVG(nav) AS avg_nav
FROM nav_history_clean
GROUP BY month
ORDER BY month;

-- ===================================================
-- 3. SIP Year-over-Year Growth
-- ===================================================
SELECT
strftime('%Y', transaction_date) AS year,
SUM(amount) AS total_sip_amount
FROM investor_transactions_clean
WHERE transaction_type = 'SIP'
GROUP BY year
ORDER BY year;

-- ===================================================
-- 4. Transactions by State
-- ===================================================
SELECT
state,
COUNT(*) AS total_transactions
FROM investor_transactions_clean
GROUP BY state
ORDER BY total_transactions DESC;

-- ===================================================
-- 5. Funds with Expense Ratio < 1%
-- ===================================================
SELECT
amfi_code,
expense_ratio
FROM scheme_performance_clean
WHERE expense_ratio < 1;

-- ===================================================
-- 6. Top 10 Funds by Highest NAV
-- ===================================================
SELECT
amfi_code,
MAX(nav) AS highest_nav
FROM nav_history_clean
GROUP BY amfi_code
ORDER BY highest_nav DESC
LIMIT 10;

-- ===================================================
-- 7. Average Expense Ratio by Fund
-- ===================================================
SELECT
AVG(expense_ratio) AS avg_expense_ratio
FROM scheme_performance_clean;

-- ===================================================
-- 8. Total Transaction Amount by Type
-- ===================================================
SELECT
transaction_type,
SUM(amount) AS total_amount
FROM investor_transactions_clean
GROUP BY transaction_type;

-- ===================================================
-- 9. Number of Transactions per Year
-- ===================================================
SELECT
strftime('%Y', transaction_date) AS year,
COUNT(*) AS total_transactions
FROM investor_transactions_clean
GROUP BY year
ORDER BY year;

-- ===================================================
-- 10. Average Returns Across Schemes
-- ===================================================
SELECT
AVG(return_1yr) AS avg_1yr_return,
AVG(return_3yr) AS avg_3yr_return,
AVG(return_5yr) AS avg_5yr_return
FROM scheme_performance_clean;
