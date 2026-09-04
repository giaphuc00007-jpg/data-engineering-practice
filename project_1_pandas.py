import pandas as pd
df = pd.read_csv("project_football/matches.csv")

print("=== 5 DÒNG ĐẦU TIÊN ===")
print(df.head())


print("\n=== THÔNG TIN BẢNG DỮ LIỆU ===")
print(df.info())


print("\n=== SỐ LƯỢNG DỮ LIỆU BỊ THIẾU (NULL) ===")
print(df.isnull().sum())


print("\n=== THỐNG KÊ MÔ TẢ ===")
print(df.describe())

df["date"] = pd.to_datetime(df["date"])

df["gf"] = df["gf"].fillna(0)
df["ga"] = df["ga"].fillna(0)


df["home_goals"] = np.where(df["venue"] == "Home", df["gf"], df["ga"])
df["away_goals"] = np.where(df["venue"] == "Home", df["ga"], df["gf"])


df["total_goals"] = df["home_goals"] + df["away_goals"]

def get_result(row):
    if row["home_goals"] > row["away_goals"]:
        return "Home Win"
    elif row["home_goals"] < row["away_goals"]:
        return "Away Win"
    else:
        return "Draw"


df["match_result"] = df.apply(get_result, axis=1)

print("=== TỶ LỆ KẾT QUẢ TRẬN ĐẤU ===")
print(df["match_result"].value_counts(normalize=True) * 100)
