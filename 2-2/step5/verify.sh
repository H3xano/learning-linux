#!/bin/bash
# Step5 - verify.sh (minimal: only command-name substrings)
# Success => print only "done" and exit 0. Any other output => failure.

set -e

# Candidate history files
H1=$(eval echo "${HISTFILE:-$HOME/.bash_history}")
FILES=(
  "$H1"
  "/home/learner/.bash_history"
  "/home/ubuntu/.bash_history"
  "/root/.bash_history"
)

seen_token() {
  local token="$1"
  shift
  for f in "$@"; do
    [ -f "$f" ] || continue
    # -F fixed strings, -I ignore binary, -q quiet, -s suppress errors
    if grep -FIqs "$token" "$f"; then
      return 0
    fi
  done
  return 1
}

# Only check command names as substrings anywhere in the line
seen_token "whoami"      "${FILES[@]}" || exit 1
seen_token "lsb_release" "${FILES[@]}" || exit 1
seen_token "hostnamectl" "${FILES[@]}" || exit 1

echo -n "done"
