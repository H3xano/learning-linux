#!/bin/bash
set -e

# Locate the report file
R="$HOME/rapport.txt"
[ -f "$R" ] || R="/home/learner/rapport.txt"
[ -s "$R" ] || exit 1   # file exists and is non-empty

# Must start with the exact title line
grep -qx '=== Mon Rapport Linux ===' "$R" || exit 1

# Must contain a username-only line (the whoami output), e.g. "learner"
# Accept lowercase username with allowed chars
grep -Eq '^[a-z_][a-z0-9_-]*$' "$R" || exit 1

# Must contain ID info (uid=…)
grep -Eq 'uid=[0-9]+' "$R" || exit 1

# Must contain uptime info (load average marker)
grep -q 'load average' "$R" || exit 1

# Optional: if you want to require the final marker line, uncomment:
# grep -qx '--- Fin du rapport ---' "$R" || exit 1

echo -n "done"
