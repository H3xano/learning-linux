#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { pat="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -Eq "$pat" "$f" && return 0; done; return 1; }

# Vérifie que grep a été utilisé sur le fichier agents.txt
found 'grep .* "Paris" .* agents\.txt' || exit 1
# Vérifie que ps | grep a été utilisé
found 'ps .* \| .* grep .* "bash"' || exit 1

echo -n "done"