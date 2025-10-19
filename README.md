# Financial-Loan-Data-Management-Reporting-Project-Python-SQL-

### Objective
Build a complete data management pipeline for loan portfolio data — cleaning, loading, and analyzing using Python and PostgreSQL.

### Workflow Summary
#### Data Preparation & Cleaning (Python)
- Read the raw dataset `financial_loan.csv` using Pandas  
- Formatted and standardized date columns (`issue_date`, `last_payment_date`, etc.)  
- Handled missing employee titles and removed duplicates  
- Ensured numeric consistency for fields like `int_rate`, `dti`, and `loan_amount`

#### Database Design & Loading (PostgreSQL + SQLAlchemy)
- Created a clean SQL table using `create_table.sql`  
- Automated data loading into PostgreSQL with the ETL script `ETL.py`  
- Verified record counts and column types after ingestion

#### Analytical SQL Reporting
- Developed **SQL queries** to analyze loan performance and borrower risk, covering:
  - Portfolio KPIs (funded amount, repayment totals, average DTI & interest rate)
  - Loan status distribution and grade-wise performance  
  - Monthly funding and repayment trends  
  - Data quality validation checks

#### Visualization & Reporting (Matplotlib)
- Each SQL output was visualized with simple, readable charts:
  - Bar charts for loan status 
  - Line charts for monthly and yearly trends  
  - Combined bar-line charts for grade vs interest rate  
  - Horizontal bars for top loan purposes

### Key Reports
1. Portfolio Overview  
2. Loan Status Breakdown  
3. Monthly Trend  
4. Grade Analysis  
5. Home Ownership Profile  
6. Purpose-Based Split  
7. Default Trends by Year  
8. Verification Impact  
9. Data Quality Validation  

### Tools & Technologies
| Category | Tools |
|-----------|--------|
| Programming | Python (Pandas, SQLAlchemy, Matplotlib) |
| Database | PostgreSQL (pgAdmin 4) |
| Purpose | Data Cleaning, ETL Automation, SQL Analysis, Visualization | 


