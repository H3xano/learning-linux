#!/bin/bash
set -e
FILES=("/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qF "$p" "$f" && return 0; done; return 1; }

# Vérifie que 'history' a été tapé
found 'history' || exit 1

# Vérifie que 'uptime' a été exécuté au moins deux fois
# (une fois dans l'étape 2, une fois ici via les flèches ou !!)
UPTIME_COUNT=$(grep -c '^uptime$' /home/learner/.bash_history || echo "0")
if [ "$UPTIME_COUNT" -lt 2 ]; then
    exit 1
fi

# Vérifie que le résultat de l'exercice d'édition est présent
# found 'echo "Linux est puissant !"' || exit 1

echo -n "done"