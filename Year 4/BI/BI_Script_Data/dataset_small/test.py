import pandas as pd

# === CONFIG ===
file_path = "filtered_flights_1.csv"  # change to your CSV file path

# === READ CSV ===
df = pd.read_csv(file_path)

# Convert relevant columns to numeric (in case of missing or blank values)
delay_cols = [
    "AIR_SYSTEM_DELAY",
    "SECURITY_DELAY",
    "AIRLINE_DELAY",
    "LATE_AIRCRAFT_DELAY",
    "WEATHER_DELAY",
    "ARRIVAL_DELAY",
    "DEPARTURE_DELAY"
]
df[delay_cols] = df[delay_cols].apply(pd.to_numeric, errors='coerce').fillna(0)

# === COMPUTE TOTAL DELAY ===
df["TOTAL_DELAY_COMPONENTS"] = (
    df["AIR_SYSTEM_DELAY"]
    + df["SECURITY_DELAY"]
    + df["AIRLINE_DELAY"]
    + df["LATE_AIRCRAFT_DELAY"]
    + df["WEATHER_DELAY"]
)

# === CHECK CONDITIONS ===
df["MATCH_ARRIVAL"] = df["TOTAL_DELAY_COMPONENTS"] == df["ARRIVAL_DELAY"]
df["MATCH_ARRIVAL_PLUS_DEPARTURE"] = (
    df["TOTAL_DELAY_COMPONENTS"] == (df["ARRIVAL_DELAY"] + df["DEPARTURE_DELAY"])
)

# === SHOW RESULTS ===
print("=== Summary ===")
print(f"Total rows: {len(df)}")
print(f"Matches arrival_delay: {df['MATCH_ARRIVAL'].sum()}")
print(f"Matches arrival+departure delay: {df['MATCH_ARRIVAL_PLUS_DEPARTURE'].sum()}")

# Print mismatches for inspection
mismatch_df = df[~(df["MATCH_ARRIVAL"] | df["MATCH_ARRIVAL_PLUS_DEPARTURE"])]
if not mismatch_df.empty:
    print("\nMismatched rows:")
    print(mismatch_df[[
        "DATE", "AIRLINE", "FLIGHT_NUMBER",
        "ARRIVAL_DELAY", "DEPARTURE_DELAY", "TOTAL_DELAY_COMPONENTS"
    ]])
else:
    print("\nAll rows matched one of the conditions!")
