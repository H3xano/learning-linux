#!/bin/bash
set -e

# Chemin vers les fichiers d'historique possibles
FILES=("$HOME/.bash_history" "/home/learner/.bash_history" "/root/.bash_history")

# Fonction pour chercher un motif dans l'historique
found() {
  local pat="$1"
  for f in "${FILES[@]}"; do
    [ -f "$f" ] || continue
    if grep -Eq "$pat" "$f"; then
      return 0 # Trouvé !
    fi
  done
  return 1 # Non trouvé
}

# Vérifie que la commande 'cat' a été tapée
# Le regex s'assure que c'est bien la commande 'cat' et non une partie d'un autre mot
if found '(^|[[:space:];|&])cat([[:space:];|&]|$)'; then
  echo -n "done"
else
  exit 1
fi