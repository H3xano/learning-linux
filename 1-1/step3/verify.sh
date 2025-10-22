#!/bin/bash
set -e

FILES=("$HOME/.bash_history" "/home/learner/.bash_history" "/root/.bash_history")

found() {
  local pat="$1"
  for f in "${FILES[@]}"; do
    [ -f "$f" ] || continue
    if grep -Eq "$pat" "$f"; then
      return 0
    fi
  done
  return 1
}

# Vérifie que les commandes ont été tapées
found '(^|[[:space:];|&])touch([[:space:];|&]|$)' || exit 1
found '(^|[[:space:];|&])echo([[:space:];|&]|$)'  || exit 1
found '(^|[[:space:];|&])cat([[:space:];|&]|$)'   || exit 1

echo -n "done"
