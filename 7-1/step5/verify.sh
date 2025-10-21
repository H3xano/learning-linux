#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found './script_rename.sh' || exit 1
# On vérifie aussi le résultat final pour s'assurer que le script a fonctionné
if [ ! -f fichier1.log.old ] || [ ! -f fichier2.log.old ]; then
    exit 1
fi

echo -n "done"