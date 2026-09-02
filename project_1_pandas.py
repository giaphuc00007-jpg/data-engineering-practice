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