#!/bin/bash
set -e

# Chemin vers les fichiers d'historique possibles
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")

# Fonction simple pour chercher une chaîne de caractères dans l'historique
found() {
  local pattern="$1"
  for f in "${FILES[@]}"; do
    [ -f "$f" ] || continue
    # Utilise grep simple. -q pour être silencieux.
    if grep -q "$pattern" "$f"; then
      return 0 # Trouvé !
    fi
  done
  return 1 # Non trouvé
}

# Vérifie que 'grep "Paris"' a été utilisé
found 'grep "Paris"' || exit 1

# Vérifie que 'ps' a été pipé dans 'grep'
found 'ps .*|.* grep' || exit 1

echo -n "done"