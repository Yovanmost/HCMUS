# Combine filtered_flights CSVs

This small script helps merge multiple `filtered_flights_*.csv` files into one CSV.

Usage (PowerShell):

```pwsh
# Run with defaults (current directory, pattern filtered_flights_*.csv)
python combine_filtered_flights.py

# Specify directory and output name, drop exact duplicate rows
python combine_filtered_flights.py --dir . --pattern filtered_flights_*.csv --out merged.csv --drop-duplicates

# Dedupe on a subset of columns (e.g. DATE, AIRLINE, FLIGHT_NUMBER)
python combine_filtered_flights.py --drop-duplicates --dedupe-on DATE AIRLINE FLIGHT_NUMBER
```

Notes:
- The script reads all matching files alphabetically, concatenates them and aligns columns by union.
- Missing column values are written as empty fields in the output CSV.
- The script uses `pandas`. If you don't have pandas installed, install it first:

```pwsh
pip install pandas
```

If you want I can also:
- produce a deduplicated version using a specific key set by default,
- create a small sanity-check report (counts per file, columns union), or
- generate a sample of merged data.
