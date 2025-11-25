#!/usr/bin/env python3
import sys
from pathlib import Path
import re

def rename_cases(folder: str, base: str) -> None:
    folder_path = Path(folder)
    if not folder_path.is_dir():
        raise SystemExit(f"Not a directory: {folder}")

    # Match files like "1.in", "2.out", etc.
    pattern = re.compile(r'^(\d+)\.(in|out)$')

    cases = {}  # index -> {"in": Path, "out": Path}
    for entry in folder_path.iterdir():
        if not entry.is_file():
            continue
        m = pattern.match(entry.name)
        if not m:
            continue

        idx_str, kind = m.groups()
        idx = int(idx_str)
        cases.setdefault(idx, {})[kind] = entry

    if not cases:
        raise SystemExit("No matching files like '1.in', '1.out', ... found.")

    # Ensure each index has both .in and .out
    for idx, d in sorted(cases.items()):
        if "in" not in d or "out" not in d:
            raise SystemExit(f"Missing pair for index {idx}: have {list(d.keys())}")

    # Determine new names and check for collisions
    mapping = []  # list of (old_path, new_path)
    sorted_indices = sorted(cases.keys())

    for new_idx, old_idx in enumerate(sorted_indices):
        in_old = cases[old_idx]["in"]
        out_old = cases[old_idx]["out"]

        in_new = folder_path / f"{base}.in.{new_idx}"
        out_new = folder_path / f"{base}.out.{new_idx}"

        mapping.append((in_old, in_new))
        mapping.append((out_old, out_new))

    # Check that no target already exists (to avoid overwriting)
    for _, new in mapping:
        if new.exists():
            raise SystemExit(f"Target file already exists: {new}")

    # Perform renames
    for old, new in mapping:
        old.rename(new)
        print(f"{old.name} -> {new.name}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} FOLDER_PATH BASE_NAME")
        print("Example:")
        print(f"  {sys.argv[0]} ./tests myproblem")
        sys.exit(1)

    folder = sys.argv[1]
    base = sys.argv[2]
    rename_cases(folder, base)
