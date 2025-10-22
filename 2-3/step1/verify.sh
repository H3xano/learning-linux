#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie que les 3 commandes essentielles ont été utilisées
found 'su' || exit 1
found 'su -' || exit 1

echo -n "done"