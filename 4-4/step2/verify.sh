#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie l'utilisation de cp -a
found 'cp -a' || exit 1
found 'chmod +x' || exit 1

# Vérifie l'utilisation de cp -i
found 'cp -i' || exit 1

echo -n "done"