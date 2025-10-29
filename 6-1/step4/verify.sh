#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie que l'utilisateur a bien écrit dans le premier fichier
found 'echo "test" >> rapport_piege.txt' || exit 1
# Vérifie qu'il a bien tenté d'écrire dans le second
found 'echo "test" >> rapport_piege2.txt' || exit 1
# Vérifie qu'il a bien manipulé umask
found 'umask' || exit 1
found 'touch nouveau_fichier_test.txt' || exit 1

echo -n "done"