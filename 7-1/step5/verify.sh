#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# On vérifie que la commande a bien été tapée
found './script_rename.sh' || exit 1

# On vérifie le résultat final en utilisant des chemins absolus
if [ ! -f /home/learner/fichier1.log.old ] || [ ! -f /home/learner/fichier2.log.old ]; then
    exit 1
fi

echo -n "done"