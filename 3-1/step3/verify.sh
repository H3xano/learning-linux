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

# Vérifie que la combinaison avec pipe a été utilisée
if ! found 'head.*\|.*tail'; then
  exit 1
fi

# Vérifie que l'option + a été utilisée avec tail
if ! found '(^|[[:space:];|&])tail .*\+'; then
  exit 1
fi

echo -n "done"