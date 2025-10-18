#!/bin/bash
set -e

FILES=("$HOME/.bash_history" "/home/learner/.bash_history" "/root/.bash_history")

found() {
  local pat="$1"
  for f in "${FILES[@]}"; do
    [ -f "$f" ] || continue
    if grep -Eq "$pat" "$f"; then return 0; fi
  done
  return 1
}

# Vérifie que la commande 'less' a été tapée
if found '(^|[[:space:];|&])less([[:space:];|&]|$)'; then
  echo -n "done"
else
  exit 1
fi