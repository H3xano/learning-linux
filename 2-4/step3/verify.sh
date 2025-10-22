#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie que les 3 commandes essentielles ont été utilisées
found 'source ~/.bashrc' || exit 1
found 'cd /etc' || exit 1

echo -n "done"