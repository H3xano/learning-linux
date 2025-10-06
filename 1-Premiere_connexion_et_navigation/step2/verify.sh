#!/bin/bash
set -e

FILES=("$HOME/.bash_history" "/home/learner/.bash_history" "/root/.bash_history")

check() {
  local pat="$1"
  for f in "${FILES[@]}"; do
    [ -f "$f" ] || continue
    if grep -Eq "$pat" "$f"; then
      return 0
    fi
  done
  return 1
}

# Match strict (évite 'update', etc.)
check '(^|[[:space:];|&])date([[:space:];|&]|$)'   || exit 1
check '(^|[[:space:];|&])cal([[:space:];|&]|$)'    || exit 1
check '(^|[[:space:];|&])ncal([[:space:];|&]|$)'   || exit 1
check '(^|[[:space:];|&])uptime([[:space:];|&]|$)' || exit 1

echo -n "done"
