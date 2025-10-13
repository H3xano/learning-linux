#!/bin/bash
# Step1 - verify.sh
# Must print only "done" on success and exit 0. Any other output = failure.

set -e

# Collect plausible history files (current shell, learner, root)
H1=$(eval echo "${HISTFILE:-$HOME/.bash_history}")
FILES=("$H1" "/home/learner/.bash_history" "/root/.bash_history")

check() {
  local pat="$1"
  shift
  for f in "$@"; do
    [ -f "$f" ] || continue
    # Use -E for ERE; -I to ignore binary; -s to be quiet about errors
    if grep -EIqs "$pat" "$f"; then
      return 0
    fi
  done
  return 1
}

# Robust patterns: match as standalone commands (allow surrounding separators/whitespace)
P_WHOAMI='(^|[[:space:];|&])whoami([[:space:];|&]|$)'
P_UNAME_A='(^|[[:space:];|&])uname[[:space:]]+-a([[:space:];|&]|$)'
P_LSB_A='(^|[[:space:];|&])lsb_release[[:space:]]+-a([[:space:];|&]|$)'
# Accept "hostnamectl" with or without args
P_HOSTNAMECTL='(^|[[:space:];|&])hostnamectl([[:space:];|&]|$)'

check "$P_UNAME_A"    "${FILES[@]}" || exit 1
check "$P_LSB_A"      "${FILES[@]}" || exit 1
check "$P_HOSTNAMECTL" "${FILES[@]}" || exit 1

echo -n "done"
