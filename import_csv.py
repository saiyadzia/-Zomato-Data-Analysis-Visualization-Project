import pandas as pd
import sqlite3

df = pd.read_csv(r"C:\PROJECTS\Zomato_SQL\zomato.csv", encoding = "latin1")

conn = sqlite3.connect("zomato.db")

df.to_sql("zomato", conn, if_exists="replace", index=False)

print("CSV successfully imported.")