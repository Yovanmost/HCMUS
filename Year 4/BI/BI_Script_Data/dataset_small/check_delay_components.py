#!/usr/bin/env python3
"""
Check at which DEPARTURE_DELAY / ARRIVAL_DELAY values the detailed delay component
columns start to contain data.

Usage:
    python check_delay_components.py path/to/filtered_flights_1.csv --out summary.csv

Produces a small summary CSV and prints results to stdout.
"""
import argparse
from pathlib import Path
import pandas as pd
import numpy as np


COMPONENT_COLS = [
    "AIR_SYSTEM_DELAY",
    "SECURITY_DELAY",
    "AIRLINE_DELAY",
    "LATE_AIRCRAFT_DELAY",
    "WEATHER_DELAY",
]


def safe_numeric(s):
    return pd.to_numeric(s, errors="coerce")


def analyze(df: pd.DataFrame, out_path: Path):
    # Ensure numeric
    df["DEPARTURE_DELAY"] = safe_numeric(df.get("DEPARTURE_DELAY"))
    df["ARRIVAL_DELAY"] = safe_numeric(df.get("ARRIVAL_DELAY"))

    for c in COMPONENT_COLS:
        df[c] = safe_numeric(df.get(c))

    rows = []

    thresholds = [-60, -30, -15, -5, 0, 5, 10, 15, 30, 60, 120]

    total = len(df)
    for comp in COMPONENT_COLS:
        comp_nonzero = df[comp].fillna(0) != 0
        comp_nonnull = ~df[comp].isna()
        # We consider a component 'present' if it's non-null and > 0 (positive minute contribution)
        present = (df[comp].fillna(0) > 0)

        # Minimal DEPARTURE_DELAY where the component is present
        try:
            min_dep = float(df.loc[present, "DEPARTURE_DELAY"].min())
        except Exception:
            min_dep = np.nan
        # Minimal ARRIVAL_DELAY where the component is present
        try:
            min_arr = float(df.loc[present, "ARRIVAL_DELAY"].min())
        except Exception:
            min_arr = np.nan

        pct_overall = present.sum() / total if total else np.nan

        threshold_stats = {}
        for t in thresholds:
            sel = df["DEPARTURE_DELAY"] >= t
            sel_count = sel.sum()
            if sel_count:
                threshold_stats[f"pct_present_dep_ge_{t}"] = present[sel].sum() / sel_count
            else:
                threshold_stats[f"pct_present_dep_ge_{t}"] = np.nan

        row = {
            "component": comp,
            "min_departure_delay_with_component": min_dep,
            "min_arrival_delay_with_component": min_arr,
            "pct_present_overall": pct_overall,
            "count_present_overall": int(present.sum()),
            "total_rows": int(total),
        }
        row.update(threshold_stats)
        rows.append(row)

    out_df = pd.DataFrame(rows)
    out_df.to_csv(out_path, index=False)

    # Print concise report
    print("Delay components summary:\n")
    print(out_df.to_string(index=False))
    print(f"\nWrote summary to: {out_path}\n")


def main():
    p = argparse.ArgumentParser()
    p.add_argument("csv", help="Path to input CSV")
    p.add_argument("--out", default="delay_components_summary.csv", help="Output CSV path")
    args = p.parse_args()

    csv_path = Path(args.csv)
    out_path = Path(args.out)

    if not csv_path.exists():
        raise SystemExit(f"Input file not found: {csv_path}")

    # Read CSV with pandas; let pandas infer types; treat empty strings as NaN
    df = pd.read_csv(csv_path, dtype=str, na_values=["", " "])

    analyze(df, out_path)


if __name__ == "__main__":
    main()
