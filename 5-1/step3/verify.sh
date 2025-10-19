#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie que la commande info a bien été lancée.
# Le fait que l'étudiant soit passé à l'étape suivante prouve qu'il a réussi à quitter :)
found 'info tar' || exit 1

echo -n "done"