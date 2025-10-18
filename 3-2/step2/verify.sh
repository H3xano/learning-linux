#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { pat="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -Eq "$pat" "$f" && return 0; done; return 1; }

# Vérifie l'utilisation des 4 options
found 'grep .*-i' || exit 1
found 'grep .*-v' || exit 1
found 'grep .*-n' || exit 1
found 'grep .*-c' || exit 1

echo -n "done"