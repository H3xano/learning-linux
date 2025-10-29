#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie l'utilisation de rmdir
found 'rmdir dossier_vide' || exit 1

# Vérifie l'utilisation de rm -r seul au début
found 'rm -r mon_projet/src/tests' || exit 1

# Vérifie l'utilisation de la combinaison sécurisée -rI ou -Ir
if found 'rm -rI' || found 'rm -Ir'; then
    echo -n "done"
else
    exit 1
fi