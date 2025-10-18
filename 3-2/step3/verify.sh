#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { pat="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -Eq "$pat" "$f" && return 0; done; return 1; }

# Vérifie la recherche multi-fichiers
found 'grep .* "\*" T.*\.log' || exit 1
# Vérifie la recherche récursive
found 'grep .*-r' || exit 1

echo -n "done"