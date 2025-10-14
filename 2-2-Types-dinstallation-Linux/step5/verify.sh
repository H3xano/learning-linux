#!/bin/bash
# Step5 - verify.sh (minimal: only command names)
# Success => print only "done" and exit 0. Any other output => failure.

set -e

H1=$(eval echo "${HISTFILE:-$HOME/.bash_history}")
FILES=("$H1" "/home/learner/.bash_history" "/root/.bash_history")

check_cmd() {
  local name="$1"; shift
  local pat="(^|[[:space:];|&])${name}([[:space:];|&]|$)"
  for f in "$@"; do
    [ -f "$f" ] || continue
    if grep -EIqs "$pat" "$f"; then
      return 0
    fi
  done
  return 1
}

check_cmd "echo"         "${FILES[@]}" || exit 1
check_cmd "whoami"       "${FILES[@]}" || exit 1
check_cmd "lsb_release"  "${FILES[@]}" || exit 1
check_cmd "hostnamectl"  "${FILES[@]}" || exit 1

echo -n "done"
