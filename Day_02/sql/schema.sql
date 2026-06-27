

CREATE TABLE dim_fund (
fund_id INTEGER PRIMARY KEY AUTOINCREMENT,
amfi_code INTEGER UNIQUE NOT NULL,
scheme_name TEXT NOT NULL,
fund_house TEXT,
category TEXT,
sub_category TEXT,
risk_category TEXT
);

CREATE TABLE dim_date (
date_id INTEGER PRIMARY KEY AUTOINCREMENT,
full_date DATE UNIQUE NOT NULL,
day INTEGER,
month INTEGER,
quarter INTEGER,
year INTEGER
);

-- =====================================
-- Fact Tables
-- =====================================

CREATE TABLE fact_nav (
nav_id INTEGER PRIMARY KEY AUTOINCREMENT,
amfi_code INTEGER NOT NULL,
date_id INTEGER NOT NULL,
nav REAL NOT NULL,

```
FOREIGN KEY (amfi_code)
    REFERENCES dim_fund(amfi_code),

FOREIGN KEY (date_id)
    REFERENCES dim_date(date_id)
```

);

CREATE TABLE fact_transactions (
transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
amfi_code INTEGER NOT NULL,
date_id INTEGER NOT NULL,
investor_id INTEGER,
transaction_type TEXT,
amount REAL,

```
FOREIGN KEY (amfi_code)
    REFERENCES dim_fund(amfi_code),

FOREIGN KEY (date_id)
    REFERENCES dim_date(date_id)
```

);

CREATE TABLE fact_performance (
performance_id INTEGER PRIMARY KEY AUTOINCREMENT,
amfi_code INTEGER NOT NULL,
return_1yr_pct REAL,
return_3yr_pct REAL,
return_5yr_pct REAL,
expense_ratio_pct REAL,

```
FOREIGN KEY (amfi_code)
    REFERENCES dim_fund(amfi_code)
```

);

CREATE TABLE fact_aum (
aum_id INTEGER PRIMARY KEY AUTOINCREMENT,
amfi_code INTEGER NOT NULL,
date_id INTEGER,
aum REAL,

```
FOREIGN KEY (amfi_code)
    REFERENCES dim_fund(amfi_code),

FOREIGN KEY (date_id)
    REFERENCES dim_date(date_id)
```

);
