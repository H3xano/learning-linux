#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie l'utilisation de rmdir
found 'rmdir dossier_vide' || exit 1

# Vérifie l'utilisation de rm -r
found 'rm -r' || exit 1

# Vérifie l'utilisation de -i ou -I pour la sécurité avec rm
if found 'rm -rI' || found 'rm -Ir'; then
    echo -n "done"
else
    exit 1
fi