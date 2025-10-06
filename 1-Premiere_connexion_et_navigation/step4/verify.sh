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

# 1) Historique minimal : les commandes ont été tapées
found '(^|[[:space:];|&])echo([[:space:];|&]|$)'   || exit 1
found '(^|[[:space:];|&])whoami([[:space:];|&]|$)' || exit 1
found '(^|[[:space:];|&])id([[:space:];|&]|$)'     || exit 1
found '(^|[[:space:];|&])groups([[:space:];|&]|$)' || exit 1
found '(^|[[:space:];|&])date([[:space:];|&]|$)'   || exit 1
found '(^|[[:space:];|&])uptime([[:space:];|&]|$)' || exit 1
found '(^|[[:space:];|&])cat([[:space:];|&]|$)'    || exit 1

# 2) Fichier rapport : présent et non vide
R="$HOME/rapport.txt"
[ -f "$R" ] || R="/home/learner/rapport.txt"
[ -s "$R" ] || exit 1

# 3) Contenu attendu (tolérant au format que tu as montré)
U=$(whoami)

# Titre présent
grep -q '^=== Mon Rapport Linux ===$' "$R" || exit 1
# Nom d'utilisateur présent au moins une fois (whoami)
grep -q "$U" "$R" || exit 1
# Ligne id (au moins le marqueur uid=)
grep -Eq 'uid=[0-9]+' "$R" || exit 1
# Ligne uptime (marqueur "load average:")
grep -q 'load average:' "$R" || exit 1

# (Optionnel) Accepte la ligne finale si l'apprenant l'a ajoutée
# grep -q '^--- Fin du rapport ---$' "$R" >/dev/null 2>&1 || true

echo -n "done"
