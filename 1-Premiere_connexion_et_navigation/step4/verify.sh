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

# Historique minimal (commandes tapées)
found '(^|[[:space:];|&])echo([[:space:];|&]|$)'   || exit 1
found '(^|[[:space:];|&])whoami([[:space:];|&]|$)' || exit 1
found '(^|[[:space:];|&])id([[:space:];|&]|$)'     || exit 1
found '(^|[[:space:];|&])groups([[:space:];|&]|$)' || exit 1
found '(^|[[:space:];|&])date([[:space:];|&]|$)'   || exit 1
found '(^|[[:space:];|&])uptime([[:space:];|&]|$)' || exit 1
found '(^|[[:space:];|&])cat([[:space:];|&]|$)'    || exit 1

# Fichier rapport : présent et non vide
R="$HOME/rapport.txt"
[ -f "$R" ] || R="/home/learner/rapport.txt"
[ -s "$R" ] || exit 1

# Contenu attendu (marqueurs simples)
U=$(whoami)
grep -q "$U" "$R"        || exit 1   # whoami dedans
grep -q "uid=" "$R"      || exit 1   # id dedans
grep -Eq 'load average| up [0-9]+' "$R" || exit 1  # uptime dedans

echo -n "done"