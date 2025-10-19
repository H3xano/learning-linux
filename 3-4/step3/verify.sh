#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie que la commande :wq a été utilisée dans vim (via l'historique)
# ou que la commande vim a été lancée. Le fait de passer à l'étape suivante valide la sortie.
if found 'vim' ; then
    echo -n "done"
else
    exit 1
fi