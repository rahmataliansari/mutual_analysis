import pandas as pd
from sqlalchemy import create_engine

# SQLite database create/connect
engine = create_engine("sqlite:///Day_02/bluestock_mf.db")

files = [
    "nav_history_clean",
    "investor_transactions_clean",
    "scheme_performance_clean"
]

for file in files:

    df = pd.read_csv(f"Day_02/data/processed/{file}.csv")

    df.to_sql(
        name=file,
        con=engine,
        if_exists="replace",
        index=False
    )

    csv_rows = len(df)

    db_rows = pd.read_sql(
        f"SELECT COUNT(*) AS count FROM {file}",
        engine
    ).iloc[0, 0]

    print(f"\nTable: {file}")
    print(f"CSV Rows: {csv_rows}")
    print(f"DB Rows : {db_rows}")

    if csv_rows == db_rows:
        print(" Row count matched")
    else:
        print(" Row count mismatch")

print("\nAll datasets loaded successfully!")