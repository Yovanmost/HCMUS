#!/usr/bin/env python3
"""
Combine multiple filtered_flights_*.csv into a single CSV.

Usage examples (PowerShell):
  python combine_filtered_flights.py
  python combine_filtered_flights.py --dir . --pattern filtered_flights_*.csv --out merged.csv --drop-duplicates

Behavior:
 - Reads files matching pattern (default filtered_flights_*.csv) in the given directory.
 - Concatenates rows, aligning columns by union of all columns (missing values = blank/NaN).
 - By default preserves file sort order (alphabetical). Optionally drop exact duplicate rows.
 - Writes a single output CSV (default merged_filtered_flights.csv).
"""
from pathlib import Path
import argparse
import pandas as pd
import sys


def find_files(directory: Path, pattern: str):
    return sorted(directory.glob(pattern))


def read_all(files):
    dfs = []
    cols_order = []
    for f in files:
        print(f"Reading: {f}")
        df = pd.read_csv(f, dtype=str, na_values=["", " "])
        dfs.append(df)
        for c in df.columns:
            if c not in cols_order:
                cols_order.append(c)
    return dfs, cols_order


def concat_align(dfs, cols_order):
    # Reindex every df to the union columns (preserve cols_order)
    reindexed = [df.reindex(columns=cols_order) for df in dfs]
    combined = pd.concat(reindexed, ignore_index=True, sort=False)
    return combined


def main():
    p = argparse.ArgumentParser(description="Combine filtered_flights CSV files into one file")
    p.add_argument("--dir", default=".", help="Directory containing files (default current)")
    p.add_argument("--pattern", default="filtered_flights_*.csv", help="Glob pattern to match input files")
    p.add_argument("--out", default="merged_filtered_flights.csv", help="Output CSV file path")
    p.add_argument("--drop-duplicates", action="store_true", help="Drop exact duplicate rows after concat")
    p.add_argument("--dedupe-on", nargs="*", help="List of columns to dedupe on (keeps first occurrence). If given, dedupe uses subset instead of full-row duplicates")
    args = p.parse_args()

    directory = Path(args.dir)
    files = find_files(directory, args.pattern)
    if not files:
        print(f"No files found in {directory} matching {args.pattern}")
        sys.exit(1)

    dfs, cols_order = read_all(files)
    combined = concat_align(dfs, cols_order)

    before = len(combined)
    if args.drop_duplicates:
        if args.dedupe_on:
            combined = combined.drop_duplicates(subset=args.dedupe_on, keep="first")
        else:
            combined = combined.drop_duplicates(keep="first")
    after = len(combined)

    out_path = Path(args.out)
    combined.to_csv(out_path, index=False)

    print("\nSummary:")
    print(f"  files_read: {len(files)}")
    print(f"  rows_before_dedup: {before}")
    if args.drop_duplicates:
        print(f"  rows_after_dedup: {after} (removed {before-after} duplicates)")
    print(f"  output_written: {out_path.resolve()}")


if __name__ == '__main__':
    main()
