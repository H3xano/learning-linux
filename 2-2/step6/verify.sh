#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qE "$p" "$f" && return 0; done; return 1; }
found 'echo .*\$\(\(' || exit 1
found 'FICHIER="image.jpeg"' || exit 1
found 'echo "Nouveau nom : \${FICHIER%.jpeg}.jpg"' || exit 1
found 'echo "Nom du fichier : \${CHEMIN##\*/}"' || exit 1
echo -n "done"