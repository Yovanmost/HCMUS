import pandas as pd
import os
from typing import List, Tuple, Dict

# --- Configuration ---
# You must change this to the actual path of your CSV file
CSV_FILE_PATH = 'dataset_small\merged_filtered_flights.csv'

# Define the expected columns based on your request (used primarily for sample data creation)
ALL_COLUMNS = [
    'DATE', 'AIRLINE', 'FLIGHT_NUMBER', 'TAIL_NUMBER', 'ORIGIN_AIRPORT',
    'DESTINATION_AIRPORT', 'SCHEDULED_DEPARTURE', 'DEPARTURE_TIME',
    'DEPARTURE_DELAY', 'TAXI_OUT', 'WHEELS_OFF', 'SCHEDULED_TIME',
    'ELAPSED_TIME', 'AIR_TIME', 'DISTANCE', 'WHEELS_ON', 'TAXI_IN',
    'SCHEDULED_ARRIVAL', 'ARRIVAL_TIME', 'ARRIVAL_DELAY', 'DIVERTED',
    'CANCELLED', 'CANCELLATION_REASON', 'AIR_SYSTEM_DELAY',
    'SECURITY_DELAY', 'AIRLINE_DELAY', 'LATE_AIRCRAFT_DELAY',
    'WEATHER_DELAY', 'CREATED', 'MODIFIED'
]

# Define the list of column combinations (subsets) you want to test for uniqueness.
# These are tuples of column names that are good candidates for a composite primary key.
CANDIDATE_KEYS: List[Tuple[str, ...]] = [
    # 1. Date and Flight Number (Highly likely to be unique)
    ('DATE', 'FLIGHT_NUMBER'),

    # 2. Tail Number (Specific plane) and Scheduled Departure Time
    ('TAIL_NUMBER', 'SCHEDULED_DEPARTURE'),

    # 3. Origin, Destination, and Scheduled Departure Time
    ('ORIGIN_AIRPORT', 'DESTINATION_AIRPORT', 'SCHEDULED_DEPARTURE'),

    # 4. A comprehensive combination, often a solid PK choice for flights
    ('DATE', 'AIRLINE', 'FLIGHT_NUMBER'),

    # 5. Using the ID attributes (Tail, Flight, Date, Time)
    ('TAIL_NUMBER', 'FLIGHT_NUMBER', 'DATE', 'SCHEDULED_DEPARTURE'),

    # 6. Just the Tail Number (Only useful if the dataset is already aggregated by plane)
    ('TAIL_NUMBER',),

    # 7. All columns (The ultimate unique set, useful as a baseline)
    tuple(ALL_COLUMNS),

    # 8.
    ('DATE', 'AIRLINE', 'FLIGHT_NUMBER', 'ORIGIN_AIRPORT', 'SCHEDULED_DEPARTURE'),

    # # 9.
    # ('TAIL_NUMBER', 'FLIGHT_NUMBER'),
]

def load_data(file_path: str, columns: List[str]) -> pd.DataFrame:
    """
    Loads the CSV file into a pandas DataFrame.
    If the file does not exist, it creates a small sample DataFrame for testing.
    """
    print(f"Attempting to load data from: {file_path}")
    if os.path.exists(file_path):
        try:
            # We only load the columns we need to save memory/time
            df = pd.read_csv(file_path, usecols=[col for subset in CANDIDATE_KEYS for col in subset])
            # If your DATE column is not parsed as a string or object, convert it
            if 'DATE' in df.columns:
                 df['DATE'] = df['DATE'].astype(str)
            print(f"Successfully loaded {len(df)} rows.")
            return df
        except Exception as e:
            print(f"Error loading CSV file: {e}")
            print("Creating a small sample DataFrame instead...")
            return create_sample_data(columns)
    else:
        print(f"File not found: {file_path}")
        print("Creating a small sample DataFrame for demonstration purposes.")
        print("NOTE: You MUST update CSV_FILE_PATH to analyze your actual data.")
        return create_sample_data(columns)

def create_sample_data(columns: List[str]) -> pd.DataFrame:
    """
    Creates a sample DataFrame for demonstration.
    It includes intentional duplicates for testing the logic.
    """
    data = {
        'DATE': ['2023-01-01', '2023-01-01', '2023-01-02', '2023-01-02', '2023-01-01'],
        'AIRLINE': ['UA', 'UA', 'DL', 'DL', 'AA'],
        'FLIGHT_NUMBER': [100, 100, 200, 201, 300],
        'TAIL_NUMBER': ['N123AA', 'N123AA', 'N456BB', 'N789CC', 'N555DD'],
        'SCHEDULED_DEPARTURE': ['08:00:00', '08:00:00', '12:00:00', '14:00:00', '10:00:00'],
        'ORIGIN_AIRPORT': ['SFO', 'SFO', 'ATL', 'ATL', 'JFK'],
        'DESTINATION_AIRPORT': ['LAX', 'LAX', 'MIA', 'MIA', 'ORD'],
    }
    # Fill in dummy values for all other columns
    for col in columns:
        if col not in data:
            data[col] = [''] * len(data['DATE']) # Use empty strings as placeholders

    # This sample has duplicates in:
    # 1. ('DATE', 'FLIGHT_NUMBER') -> Row 0 and 1
    # 2. ('TAIL_NUMBER', 'SCHEDULED_DEPARTURE') -> Row 0 and 1
    # 3. ('ORIGIN_AIRPORT', 'DESTINATION_AIRPORT', 'SCHEDULED_DEPARTURE') -> Row 0 and 1

    df_sample = pd.DataFrame(data, columns=columns)
    # Filter the sample to only include necessary columns for the test
    required_cols = list(set([col for subset in CANDIDATE_KEYS for col in subset]))
    return df_sample[required_cols]


def check_uniqueness(df: pd.DataFrame, candidate_keys: List[Tuple[str, ...]]) -> Dict[str, bool]:
    """
    Iterates through candidate key combinations and checks for duplicates.
    """
    results: Dict[str, bool] = {}
    total_rows = len(df)

    print("\n--- Uniqueness Check Results ---")
    print(f"Total Rows Analyzed: {total_rows}\n")

    for key_combo in candidate_keys:
        key_str = ", ".join(key_combo)

        # Ensure all columns in the key combination exist in the DataFrame
        missing_cols = [col for col in key_combo if col not in df.columns]
        if missing_cols:
            results[key_str] = False
            print(f"[SKIPPED] Columns not found: {', '.join(missing_cols)}")
            continue

        # Check for duplicated rows based ONLY on the columns in the combination
        has_duplicates = df.duplicated(subset=list(key_combo), keep=False).any()

        if not has_duplicates:
            results[key_str] = True
            print(f"✅ UNIQUE: ({key_str}) - Perfect Primary Key Candidate!")
        else:
            results[key_str] = False
            # Count the number of duplicated rows
            num_duplicates = df.duplicated(subset=list(key_combo), keep='first').sum()
            print(f"❌ DUPLICATES: ({key_str}) - {num_duplicates} sets of duplicate keys found.")

            # If this candidate is the 'All columns' candidate, show which sets of values are duplicated
            # If this candidate is the 'All columns' candidate, show duplicated full-row groups
            full_cols = tuple(ALL_COLUMNS)
            if tuple(key_combo) == full_cols:
                # Find all rows that are part of duplicated full-row values
                dup_mask = df.duplicated(subset=list(key_combo), keep=False)
                dups = df.loc[dup_mask]
                total_dup_rows = len(dups)

                if total_dup_rows == 0:
                    print("  (no duplicated full-row values found despite earlier flag)")
                else:
                    # Group identical rows (grouping by all columns) -> collect their row indices
                    # Build groups in a pandas-version-robust way:
                    # 1) create a temporary string key that represents the full-row values for grouping
                    tmp_key_col = "_dup_key_temp"
                    # join using a separator that unlikely appears in fields
                    dups = dups.copy()
                    dups[tmp_key_col] = dups[list(key_combo)].astype(str).agg('||'.join, axis=1)

                    # 2) group by that temporary key and collect row indices
                    grouped_series = dups.groupby(tmp_key_col).apply(lambda g: g.index.tolist())
                    grouped = grouped_series.reset_index()
                    # rename columns to be clear
                    grouped.columns = [tmp_key_col, 'indices']

                    # drop the temporary key column from the duplicated rows copy to avoid leaking it
                    dups.drop(columns=[tmp_key_col], inplace=True)

                    print(f"  Found {len(grouped)} distinct duplicated full-row value(s), total duplicate rows: {total_dup_rows}")
                    # Print up to 10 groups with their sizes and indices, and an example of values
                    for i, r in grouped.head(10).iterrows():
                        indices = r['indices']
                        size = len(indices)
                        print(f"    Group {i+1}: {size} rows; indices: {indices[:20]}")
                        # show a compact example of the values for this duplicated row
                        example_vals = df.loc[indices[0], list(key_combo)].to_dict()
                        # print only a subset of columns for readability if many columns
                        example_preview = {k: example_vals[k] for k in list(example_vals)[:8]}
                        print(f"      example (first 8 cols): {example_preview}")
                    if len(grouped) > 10:
                        print(f"    ... and {len(grouped)-10} more duplicated groups not printed")

    return results

def main():
    """Main function to run the primary key analysis."""
    # 1. Load Data
    df = load_data(CSV_FILE_PATH, ALL_COLUMNS)

    if df.empty:
        print("\nCannot proceed: DataFrame is empty after loading.")
        return

    # 2. Perform Uniqueness Check
    check_uniqueness(df, CANDIDATE_KEYS)

    print("\n--- Analysis Complete ---")
    print("A combination is a Primary Key candidate if it is marked 'UNIQUE'.")
    print("Remember to try additional combinations in the 'CANDIDATE_KEYS' list.")


if __name__ == "__main__":
    main()