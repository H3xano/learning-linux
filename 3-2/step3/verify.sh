#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie qu'on a cherché dans les fichiers .log avec '*'
found 'grep .* \*\.log' || exit 1

# Vérifie que l'option -r a été utilisée
found 'grep -r' || exit 1

echo -n "done"